example 1 link : https://jay-verilog.github.io/APB_CSR_Generator/
example 2 link : https://jay-verilog.github.io/spi2_example_webpage/
# APB CSR Generator

## How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/jay-verilog/APB_CSR_Generator.git
```

### 2. Enter the Project Directory

```bash
cd APB_CSR_Generator
```

### 3. Check Python

Make sure Python 3 is installed:

```bash
python3 --version
```

### 4. Run the Generator

```bash
python3 csr_generator_apb.py
```

The generator uses an XML file to define the IP block, registers, and register fields.

---

# XML Register Map

The XML file defines the complete register map.

The main structure is:

```text
Register Map
│
├── Block Information
│   ├── Block Name
│   ├── Data Width
│   ├── Address Width
│   ├── Base Address
│   └── Register Width
│
├── Register 0
│   ├── Register Name
│   ├── Offset Address
│   └── Fields
│       ├── Single-Bit Field
│       ├── Vector Field
│       └── Reserved Field
│
├── Register 1
│   └── Fields
│
└── Register 2
    └── Fields
```

---

# Complete XML Example

The following example shows a SPI IP block containing different types of registers and fields.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<Register_Map>

    <!-- IP Block Information -->

    <block_name block_name="spi"></block_name>

    <data_width data_width="32"></data_width>

    <address_width addr_width="32"></address_width>

    <base_address base_addr="'h3500_0000"></base_address>

    <register_width reg_width="32"></register_width>


    <!-- CONTROL REGISTER 1 -->

    <Register_SPI_CONTROL_REGISTER1
        reg_name="CONTROL_REGISTER1"
        offset_addr="'h0"
        reg_description="SPI Control Register 1">

        <!-- Reserved vector field: bits 31:8 -->

        <Field
            field_name="RESERVED"
            field_access_type="ro"
            field_reset_value="0"
            field_position="31:8"
            field_description="Reserved for future expansion."/>

        <!-- Single-bit field: bit 7 -->

        <Field
            field_name="SPIE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="7"
            field_description="SPI interrupt enable."/>

        <!-- Single-bit field: bit 6 -->

        <Field
            field_name="SPE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="6"
            field_description="SPI enable."/>

        <!-- Single-bit field: bit 5 -->

        <Field
            field_name="SPTIE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="5"
            field_description="SPI transmit interrupt enable."/>

        <!-- Single-bit field: bit 4 -->

        <Field
            field_name="MSTR"
            field_access_type="wr"
            field_reset_value="0"
            field_position="4"
            field_description="Master mode select."/>

        <!-- Single-bit field: bit 3 -->

        <Field
            field_name="CPOL"
            field_access_type="wr"
            field_reset_value="0"
            field_position="3"
            field_description="Clock polarity."/>

        <!-- Single-bit field: bit 2 -->

        <Field
            field_name="CPHA"
            field_access_type="wr"
            field_reset_value="0"
            field_position="2"
            field_description="Clock phase."/>

        <!-- Single-bit field: bit 1 -->

        <Field
            field_name="SSOE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="1"
            field_description="Slave select output enable."/>

        <!-- Single-bit field: bit 0 -->

        <Field
            field_name="LSBFE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="0"
            field_description="LSB first enable."/>

    </Register_SPI_CONTROL_REGISTER1>


    <!-- CONTROL REGISTER 2 -->

    <Register_SPI_CONTROL_REGISTER2
        reg_name="CONTROL_REGISTER2"
        offset_addr="'h1"
        reg_description="SPI Control Register 2">

        <!-- Vector field: bits 6:4 -->

        <Field
            field_name="SAMPLE"
            field_access_type="wr"
            field_reset_value="1"
            field_position="6:4"
            field_description="SPI sampling configuration."/>

        <!-- Single-bit field -->

        <Field
            field_name="MODFEN"
            field_access_type="wr"
            field_reset_value="0"
            field_position="3"
            field_description="Mode fault enable."/>

        <!-- Single-bit field -->

        <Field
            field_name="BIDIROE"
            field_access_type="wr"
            field_reset_value="0"
            field_position="2"
            field_description="Bidirectional output enable."/>

        <!-- Single-bit field -->

        <Field
            field_name="SPISWAI"
            field_access_type="wr"
            field_reset_value="0"
            field_position="1"
            field_description="SPI stop in wait mode."/>

        <!-- Single-bit field -->

        <Field
            field_name="SPC0"
            field_access_type="wr"
            field_reset_value="0"
            field_position="0"
            field_description="SPI configuration bit."/>

        <!-- Reserved vector -->

        <Field
            field_name="RESERVED"
            field_access_type="ro"
            field_reset_value="0"
            field_position="31:7"
            field_description="Reserved for future expansion."/>

    </Register_SPI_CONTROL_REGISTER2>


    <!-- BAUD RATE REGISTER -->

    <Register_SPI_BAUD_RATE_REGISTER
        reg_name="BAUD_RATE_REGISTER"
        offset_addr="'h2"
        reg_description="SPI Baud Rate Register">

        <!-- Reserved vector -->

        <Field
            field_name="RESERVED1"
            field_access_type="ro"
            field_reset_value="0"
            field_position="31:7"
            field_description="Reserved for future expansion."/>

        <!-- Vector field: bits 6:4 -->

        <Field
            field_name="SPPR"
            field_access_type="wr"
            field_reset_value="0"
            field_position="6:4"
            field_description="SPI baud rate prescaler."/>

        <!-- Reserved single bit -->

        <Field
            field_name="RESERVED2"
            field_access_type="ro"
            field_reset_value="0"
            field_position="3"
            field_description="Reserved for future expansion."/>

        <!-- Vector field: bits 2:0 -->

        <Field
            field_name="SPR"
            field_access_type="wr"
            field_reset_value="0"
            field_position="2:0"
            field_description="SPI baud rate selection."/>

    </Register_SPI_BAUD_RATE_REGISTER>


    <!-- STATUS REGISTER -->

    <Register_SPI_STATUS_REGISTER
        reg_name="STATUS_REGISTER"
        offset_addr="'h3"
        reg_description="SPI Status Register">

        <!-- Reserved vector -->

        <Field
            field_name="RESERVED1"
            field_access_type="ro"
            field_reset_value="0"
            field_position="31:8"
            field_description="Reserved for future expansion."/>

        <!-- Read-only single-bit field -->

        <Field
            field_name="SPIF"
            field_access_type="ro"
            field_reset_value="0"
            field_position="7"
            field_description="SPI transfer complete flag."/>

        <!-- Reserved single bit -->

        <Field
            field_name="RESERVED2"
            field_access_type="ro"
            field_reset_value="0"
            field_position="6"
            field_description="Reserved for future expansion."/>

        <!-- Read-only single-bit field -->

        <Field
            field_name="SPTEF"
            field_access_type="ro"
            field_reset_value="0"
            field_position="5"
            field_description="SPI transmit buffer empty flag."/>

        <!-- Read-only single-bit field -->

        <Field
            field_name="MODF"
            field_access_type="ro"
            field_reset_value="0"
            field_position="4"
            field_description="Mode fault flag."/>

        <!-- Reserved vector -->

        <Field
            field_name="RESERVED3"
            field_access_type="ro"
            field_reset_value="0"
            field_position="3:0"
            field_description="Reserved for future expansion."/>

    </Register_SPI_STATUS_REGISTER>


    <!-- DATA REGISTER -->

    <Register_SPI_DATA_REGISTER
        reg_name="DATA_REGISTER"
        offset_addr="'h4"
        reg_description="SPI Data Register">

        <!-- Complete 32-bit vector -->

        <Field
            field_name="DATA"
            field_access_type="wr"
            field_reset_value="0"
            field_position="31:0"
            field_description="SPI data."/>

    </Register_SPI_DATA_REGISTER>


    <!-- COMMAND REGISTER -->

    <Register_SPI_COMMAND_REGISTER
        reg_name="COMMAND_REGISTER"
        offset_addr="'h5"
        reg_description="SPI Command Register">

        <!-- Reserved vector -->

        <Field
            field_name="RESERVED"
            field_access_type="ro"
            field_reset_value="0"
            field_position="31:3"
            field_description="Reserved for future expansion."/>

        <!-- Write-only single-bit field -->

        <Field
            field_name="START"
            field_access_type="wo"
            field_reset_value="0"
            field_position="2"
            field_description="Start SPI operation."/>

        <!-- Write-only single-bit field -->

        <Field
            field_name="CLEAR"
            field_access_type="wo"
            field_reset_value="0"
            field_position="1"
            field_description="Clear SPI status."/>

        <!-- Write-only single-bit field -->

        <Field
            field_name="ABORT"
            field_access_type="wo"
            field_reset_value="0"
            field_position="0"
            field_description="Abort SPI operation."/>

    </Register_SPI_COMMAND_REGISTER>

</Register_Map>
```

---

# Field Types

## 1. Single-Bit Field

Use a single number for `field_position`.

```xml
<Field
    field_name="SPIE"
    field_access_type="wr"
    field_reset_value="0"
    field_position="7"
    field_description="SPI interrupt enable."/>
```

This creates:

```text
Bit 7
  |
  ↓
+---+
|SPIE|
+---+
```

---

## 2. Vector / Multi-Bit Field

Use `MSB:LSB` for a vector.

```xml
<Field
    field_name="SAMPLE"
    field_access_type="wr"
    field_reset_value="1"
    field_position="6:4"
    field_description="SPI sampling configuration."/>
```

This creates:

```text
Bits
  6       5       4
+-------+-------+-------+
|       SAMPLE          |
+-------+-------+-------+
```

In SystemVerilog, this corresponds to:

```systemverilog
logic [6:4] SAMPLE;
```

---

## 3. Full 32-Bit Vector

```xml
<Field
    field_name="DATA"
    field_access_type="wr"
    field_reset_value="0"
    field_position="31:0"
    field_description="SPI data."/>
```

This corresponds to:

```systemverilog
logic [31:0] DATA;
```

---

## 4. Reserved Vector

Reserved bits can also be represented as a vector:

```xml
<Field
    field_name="RESERVED"
    field_access_type="ro"
    field_reset_value="0"
    field_position="31:8"
    field_description="Reserved for future expansion."/>
```

This represents:

```text
31                         8 7       0
+---------------------------+---------+
|         RESERVED          |   DATA  |
+---------------------------+---------+
```

---

# Register Types

## Read/Write Register

```xml
<Register_SPI_CONTROL_REGISTER1
    reg_name="CONTROL_REGISTER1"
    offset_addr="'h0"
    reg_description="SPI Control Register 1">
```

Typical field:

```xml
<Field
    field_name="SPIE"
    field_access_type="wr"
    field_reset_value="0"
    field_position="7"
    field_description="SPI interrupt enable."/>
```

---

## Read-Only Register

```xml
<Register_SPI_STATUS_REGISTER
    reg_name="STATUS_REGISTER"
    offset_addr="'h3"
    reg_description="SPI Status Register">
```

Field:

```xml
<Field
    field_name="SPIF"
    field_access_type="ro"
    field_reset_value="0"
    field_position="7"
    field_description="SPI transfer complete flag."/>
```

---

## Write-Only Register

```xml
<Register_SPI_COMMAND_REGISTER
    reg_name="COMMAND_REGISTER"
    offset_addr="'h5"
    reg_description="SPI Command Register">
```

Field:

```xml
<Field
    field_name="START"
    field_access_type="wo"
    field_reset_value="0"
    field_position="2"
    field_description="Start SPI operation."/>
```

---

# Register Address Example

For this example:

```text
Base Address = 0x3500_0000
```

The register offsets are:

```text
CONTROL_REGISTER1   = 0x0
CONTROL_REGISTER2   = 0x1
BAUD_RATE_REGISTER  = 0x2
STATUS_REGISTER     = 0x3
DATA_REGISTER       = 0x4
COMMAND_REGISTER    = 0x5
```

---

# Run the Generator

After creating or modifying the XML file:

```bash
python3 csr_generator_apb.py
```

The generator reads the XML register specification and generates the required output.

For the SPI example, the repository contains:

```text
spi.xml
```

and the generated documentation:

```text
spi_doc.html
```

The repository also contains the generated RTL under:

```text
rtl/
```

---

# Example Project Structure

```text
APB_CSR_Generator/
│
├── csr_generator_apb.py
│
├── spi.xml
│
├── spi_doc.html
│
├── rtl/
│   ├── ...
│   └── ...
│
└── README.md
```

---

# Complete Flow

```text
                 XML
                  │
                  │
                  ▼
        ┌───────────────────┐
        │ csr_generator_apb │
        │       .py         │
        └─────────┬─────────┘
                  │
        ┌─────────┴──────────┐
        │                    │
        ▼                    ▼
   Register Map           RTL
        │                    │
        ▼                    ▼
   spi_doc.html          rtl/
```

The XML therefore acts as the **single register-map specification** containing the block information, registers, fields, vector fields, access types, reset values, offsets, and descriptions.
