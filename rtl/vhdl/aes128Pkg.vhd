-------------------------------------------------------------------------------
--! @file       aes128Pkg.vhd
--! @brief      AES-128 Package
--! @project    VLSI Book - AES-128 Example
--! @author     Michael Muehlberghuber (mbgh@iis.ee.ethz.ch)
--! @company    Integrated Systems Laboratory, ETH Zurich
--! @copyright  Copyright (C) 2014 Integrated Systems Laboratory, ETH Zurich
--! @date       2014-06-05
--! @updated    2014-10-16
--! @platform   Simulation: ModelSim; Synthesis: Synopsys
--! @standard   VHDL'93/02
-------------------------------------------------------------------------------
-- Revision Control System Information:
-- File ID      :  $Id: aes128Pkg.vhd 21 2014-10-17 16:06:52Z u59323933 $
-- Revision     :  $Revision: 21 $
-- Local Date   :  $Date: 2014-10-17 18:06:52 +0200 (Fri, 17 Oct 2014) $
-- Modified By  :  $Author: u59323933 $
-------------------------------------------------------------------------------
-- Major Revisions:
-- Date        Version   Author    Description
-- 2014-06-05  1.0       michmueh  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package aes128Pkg is

  -----------------------------------------------------------------------------
  -- Type definitions
  -----------------------------------------------------------------------------
  subtype Byte is std_logic_vector(7 downto 0);
  type Word is array (0 to 3) of Byte;
  type Matrix is array (0 to 3) of Word;
  type roundkeyArrayType is array (0 to 10) of Matrix;

end package aes128Pkg;