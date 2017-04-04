import logging
import sys

from os import path, remove, symlink


def main():
    quiet_mode = "-q" in sys.argv[1:]

    if not quiet_mode:
        logging.basicConfig(level=logging.INFO, format="%(message)s")

    ensure_symlink("./vim", "~/.vim")
    ensure_symlink("./vim/vimrc", "~/.vimrc")


def ensure_symlink(source_path, target_path):
    """Ensure a symlink exists at target_path, that points to source_path.
    """
    if source_path.startswith("./"):
        base_dir = path.abspath(path.dirname(__file__))
        abs_source_path = path.join(base_dir, source_path[2:])
    else:
        abs_source_path = path.abspath(path.expanduser(source_path))

    abs_target_path = path.abspath(path.expanduser(target_path))

    log = start_logger("Ensuring %s points to %s", abs_target_path, abs_source_path)

    if path.islink(abs_target_path) or not path.exists(abs_target_path):
        current_value = path.abspath(path.realpath(abs_target_path))

        if current_value == abs_source_path:
            log("%s already points to %s: SKIPPING", abs_target_path, current_value)
            return

        log("%s currently points to %s", abs_target_path, current_value)

        if path.exists(abs_target_path):
            log("Removing %s", abs_target_path)
            remove(abs_target_path)

        log("Adding link from %s to %s", abs_target_path, abs_source_path)
        symlink(abs_source_path, abs_target_path)
    else:
        raise ValueError(
            "Expected a symlink at {0}, but found a file or directory".format(abs_target_path)
        )


def start_logger(title, *args, **kwargs):
    logging.info(title, *args, **kwargs)

    def log(line, *args, **kwargs):
        indented_line = "  " + line
        logging.info(indented_line, *args, **kwargs)

    return log


if __name__ == "__main__":
    main()