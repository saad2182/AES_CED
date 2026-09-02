"""Remove only generated simulator artifacts from this repository."""

from __future__ import annotations

import shutil
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]


def remove(path: Path) -> None:
    resolved = path.resolve()
    if REPO_ROOT not in resolved.parents:
        raise RuntimeError(f"Refusing to remove a path outside the repository: {resolved}")
    if resolved.is_dir():
        shutil.rmtree(resolved)
    elif resolved.exists():
        resolved.unlink()


def main() -> None:
    for relative in (
        "build",
        "work",
        "csrc",
        "simv",
        "simv.daidir",
        "AN.DB",
        "DVEfiles",
        "ucli.key",
        "synopsys_sim.setup",
    ):
        remove(REPO_ROOT / relative)

    for pattern in (".vlogan*", "._*"):
        for path in REPO_ROOT.glob(pattern):
            remove(path)


if __name__ == "__main__":
    main()
