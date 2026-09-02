"""Prepare a local Synopsys VCS/VHDLAN work library.

The VHDL source in this project imports several Synopsys IEEE compatibility
packages from the local ``work`` library, matching the original course flow.
"""

from __future__ import annotations

import os
import shutil
import subprocess
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
BUILD_DIR = REPO_ROOT / "build"
WORK_DIR = BUILD_DIR / "work"
SETUP_FILE = REPO_ROOT / "synopsys_sim.setup"


def main() -> None:
    vcs_home_value = os.environ.get("VCS_HOME")
    if not vcs_home_value:
        raise SystemExit("VCS_HOME is not set. Point it to your Synopsys VCS installation.")

    vhdlan = os.environ.get("VHDLAN", "vhdlan")
    if not shutil.which(vhdlan):
        raise SystemExit(f"Could not find {vhdlan!r} on PATH.")

    vcs_home = Path(vcs_home_value).expanduser().resolve()
    ieee_dir = vcs_home / "packages" / "IEEE" / "src"
    compatibility_sources = [
        ieee_dir / "std_logic_textio.vhd",
        ieee_dir / "std_logic_signed.vhd",
        ieee_dir / "std_logic_unsigned.vhd",
        ieee_dir / "std_logic_arith.vhd",
        ieee_dir / "numeric_std.vhd",
    ]

    missing = [str(path) for path in compatibility_sources if not path.is_file()]
    if missing:
        raise SystemExit("Missing Synopsys IEEE sources:\n  " + "\n  ".join(missing))

    if WORK_DIR.exists():
        shutil.rmtree(WORK_DIR)
    WORK_DIR.mkdir(parents=True)
    SETUP_FILE.write_text("DEFAULT : ./build/work\n", encoding="ascii")

    for source in compatibility_sources:
        subprocess.run(
            [vhdlan, "-full64", str(source)],
            cwd=REPO_ROOT,
            check=True,
        )


if __name__ == "__main__":
    main()
