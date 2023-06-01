# AES Encryption Core
This repository contains a VHDL implementation of a 128-bit AES Encryption Core.

## Overview
The Advanced Encryption Standard (AES) is a symmetric encryption algorithm established by the U.S. National Institute of Standards and Technology (NIST). This repository provides an implementation of the 128-bit AES Encryption Core written in VHDL.

## Getting Started
To use this AES Encryption Core, clone this repository to your local machine. Ensure you have a VHDL compiler installed to compile and run the code.

## Features
The AES Encryption Core offers the following features:

- **128-bit AES Encryption:** The core function of this repository is to provide a VHDL implementation of the 128-bit Advanced Encryption Standard (AES) encryption algorithm.

- **Modular Design:** The design of the AES core is modular, with separate VHDL files for each major component of the AES algorithm. This includes separate modules for adding round keys, creating round keys, performing the substitution bytes operation, shifting rows, and mixing columns.

- **Test Bench:** The repository includes a test bench (`tb_aes_core.vhd`) for the AES core, allowing for testing and validation of the encryption process.

## Usage
To use the AES Encryption Core, follow these steps:

1. Clone the repository to your local machine.
2. Open the VHDL files in your preferred VHDL editor or integrated development environment (IDE).
3. The main AES core is contained in `aes_core.vhd`. This file integrates all the other modules (`add_round_key.vhd`, `create_round_key.vhd`, `sbox_block.vhd`, `shift_rows.vhd`, `mix_column_block.vhd`) to perform the AES encryption.
4. The `tb_aes_core.vhd` file can be used to test the AES core. This test bench applies test vectors to the AES core and checks the output against the expected results.

## License
This project is licensed under the GPL-3.0 License. See the `LICENSE` file for more details.
