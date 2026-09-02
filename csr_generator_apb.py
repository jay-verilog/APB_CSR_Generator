import os
import sys
import xml.etree.ElementTree as ET
import re
from collections import defaultdict


# ---------------------------- Template ----------------------------------------------
def template():
    with open("sample.xml", "w", encoding="utf-8") as file:
        file.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
        file.write("<?xml-stylesheet type=\"text/css\" href=\"style.css\"?>\n")
        file.write("\n")
        file.write("<Register_Map>\n")
        file.write("    <block_name     block_name = \"\"> </block_name>  <!-- block should in lower_case -->\n")
        file.write("    <data_width     data_width = \"\"> </data_width>\n")
        file.write("    <address_width  addr_width = \"\"> </address_width>\n")
        file.write("    <register_width reg_width  = \"\"> </register_width>\n")
        file.write("\n")
        file.write("\n")
        file.write("<!-- Register Map -->\n")
        file.write("    <Register_NAME\n")
        file.write("        name    = \"NAME1\"   \n")
        file.write("        address = \"'h\"\n")
        file.write("        reset   = \"'h\"\n")
        file.write("        wr      = \"\">   <!-- \"wr\" = write and read. \"r\" = read only.  -->\n")
        file.write("        <Field name = \"\"   bits=\"3'b111\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b110\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b101\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b100\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b011\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b010\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b001\"/>\n")
        file.write("        <Field name = \"\"   bits=\"3'b000\"/>\n")
        file.write("    </Register_NAME>\n")
        file.write("\n")
        file.write("</Register_Map>\n")
        file.write("\n")
        file.write("\n")
        file.write("<!-- EXAMPLE\n")
        file.write("\n")
        file.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
        file.write("<?xml-stylesheet type=\"text/css\" href=\"style.css\"?>\n")
        file.write("\n")
        file.write("<Register_Map>\n")
        file.write("    <block_name     block_name = \"spi\"> </block_name>  \n")
        file.write("    <data_width     data_width = \"8\">   </data_width>\n")
        file.write("    <address_width  addr_width = \"3\">   </address_width>\n")
        file.write("    <register_width reg_width  = \"8\">   </register_width>\n")
        file.write("\n")
        file.write("\n")
        file.write("    <Register_SPI_CONTROL_REGISTER\n")
        file.write("        name    = \"SPI_CONTROL_REGISTER1\"\n")
        file.write("        address = \"8'b0000_0000\"\n")
        file.write("        reset   = \"8'b0000_0100\"\n")
        file.write("        wr      = \"wr\">\n")
        file.write("        <Field name=\"SPIE\"   bits=\"3'b111\"/>\n")
        file.write("        <Field name=\"SPE\"    bits=\"3'b110\"/>\n")
        file.write("        <Field name=\"SPTIE\"  bits=\"3'b101\"/>\n")
        file.write("        <Field name=\"MSTR\"   bits=\"3'b100\"/>\n")
        file.write("        <Field name=\"CPOL\"   bits=\"3'b011\"/>\n")
        file.write("        <Field name=\"CPHA\"   bits=\"3'b010\"/>\n")
        file.write("        <Field name=\"SSOE\"   bits=\"3'b001\"/>\n")
        file.write("        <Field name=\"LSBFE\"  bits=\"3'b000\"/>\n")
        file.write("    </Register_SPI_CONTROL_REGISTER>\n")
        file.write("\n")
        file.write("    <Register_SPI_CONTROL_REGISTER2\n")
        file.write("        name    = \"SPI_CONTROL_REGISTER2\"\n")
        file.write("        address = \"8'b0000_0001\"\n")
        file.write("        reset   = \"8'b0000_0000\"\n")
        file.write("        wr      = \"wr\">\n")
        file.write("        <Field name=\"MODFEN\"   bits=\"3'b100\"/>\n")
        file.write("        <Field name=\"BIDIROE\"  bits=\"3'b011\"/>\n")
        file.write("        <Field name=\"SPISWAI\"  bits=\"3'b001\"/>\n")
        file.write("        <Field name=\"SPC0\"     bits=\"3'b000\"/>\n")
        file.write("    </Register_SPI_CONTROL_REGISTER2>\n")
        file.write("\n")
        file.write("    <Register_SPI_BAUD_RATE_REGISTER\n")
        file.write("        name    = \"SPI_BAUD_RATE_REGISTER\"\n")
        file.write("        address = \"8'b0000_0010\"\n")
        file.write("        reset   = \"8'b0000_0000\"\n")
        file.write("        wr      = \"wr\">\n")
        file.write("        <Field name=\"SPPR2\" bits=\"3'b110\"/>\n")
        file.write("        <Field name=\"SPPR1\" bits=\"3'b101\"/>\n")
        file.write("        <Field name=\"SPPR0\" bits=\"3'b100\"/>\n")
        file.write("        <Field name=\"SPR2\"  bits=\"3'b010\"/>\n")
        file.write("        <Field name=\"SPR1\"  bits=\"3'b001\"/>\n")
        file.write("        <Field name=\"SPR0\"  bits=\"3'b000\"/>\n")
        file.write("    </Register_SPI_BAUD_RATE_REGISTER>\n")
        file.write("\n")
        file.write("    <Register_SPI_STATUS_REGISTER\n")
        file.write("        name    = \"SPI_STATUS_REGISTER\"\n")
        file.write("        address = \"8'b0000_0011\"\n")
        file.write("        reset   = \"8'b0010_0000\"\n")
        file.write("        wr      = \"r\">\n")
        file.write("        <Field name=\"SPIF\"  bits=\"3'b111\"/>\n")
        file.write("        <Field name=\"SPTEF\" bits=\"3'b101\"/>\n")
        file.write("        <Field name=\"MODF\"  bits=\"3'b100\"/>\n")
        file.write("    </Register_SPI_STATUS_REGISTER>\n")
        file.write("\n")
        file.write("    <Register_SPI_DATA_REGISTER\n")
        file.write("        name    = \"SPI_DATA_REGISTER\"\n")
        file.write("        address = \"8'b0000_0100\"\n")
        file.write("        reset   = \"8'b0000_0000\"\n")
        file.write("        wr      = \"wr\">\n")
        file.write("        <Field name=\"BIT7\" bits=\"3'b111\"/>\n")
        file.write("        <Field name=\"BIT6\" bits=\"3'b110\"/>\n")
        file.write("        <Field name=\"BIT5\" bits=\"3'b101\"/>\n")
        file.write("        <Field name=\"BIT4\" bits=\"3'b100\"/>\n")
        file.write("        <Field name=\"BIT3\" bits=\"3'b011\"/>\n")
        file.write("        <Field name=\"BIT2\" bits=\"3'b010\"/>\n")
        file.write("        <Field name=\"BIT1\" bits=\"3'b001\"/>\n")
        file.write("        <Field name=\"BIT0\" bits=\"3'b000\"/>\n")
        file.write("    </Register_SPI_DATA_REGISTER> \n")
        file.write("</Register_Map>\n")
        file.write("\n")
        file.write("\n")
        file.write("-->\n")


# -------------------- RTL Files --------------------
def rtl(xml_file):    
    defines(xml_file)
    csr(xml_file)
    top_level(xml_file)

#------------------------------ DEFINES -------------------------
def defines(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError("block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width']:
            continue
        regs.append(reg)

    os.makedirs("rtl", exist_ok=True)
    
    with open(f"rtl/{block_name.lower()}_defines.v", "w", encoding="utf-8") as file: 
        file.write("//-------------------------------------------------------------------------\n")
        file.write(f"//// {block_name.upper()} Register Map - Auto-generated Verilog Defines    \n")
        file.write("//-------------------------------------------------------------------------\n")
        file.write("\n")
        file.write(f"`define {block_name.upper()}_DATA_WIDTH {data_width}\n")
        file.write(f"`define {block_name.upper()}_ADDR_WIDTH {address_width}\n")
        file.write(f"`define {block_name.upper()}_REG_WIDTH  {register_width}\n")
        file.write("\n")
        
        # -------------------------- ADDRESS ---------------------
        file.write("// --------------------------\n")
        file.write("// Register Addresses\n")
        file.write("// --------------------------\n")
        file.write("\n")

        for reg in regs:
            reg_addr = reg.get('address')
            reg_name = reg.get('name')
            file.write(f"`define {block_name.upper()}_{reg_name.upper()}_ADDR {reg_addr}\n")
        
        file.write("\n")
        
        # -------------------------- RESET ----------------------
        file.write("// --------------------------\n")
        file.write("// Register Reset Values\n")
        file.write("// --------------------------\n")
        file.write("\n")

        for reg in regs:
            reg_rst = reg.get('reset')
            reg_name = reg.get('name')
            file.write(f"`define {block_name.upper()}_{reg_name.upper()}_RST {reg_rst}\n")

        file.write("\n")

        # --------------------------- VECTOR WIDTHS ---------------
        file.write("// --------------------------\n")
        file.write("// Vector Output Widths\n")
        file.write("// --------------------------\n")
        file.write("\n")
        
        vector_groups = defaultdict(list)
        
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            if reg_wr != "wr":
                continue
            for field in reg.findall('Field'):
                bit_name = field.get('bit_name')
                bit_pos = field.get('bit_position')
                prefix = bit_name.rstrip('0123456789')
                if prefix and prefix != bit_name:
                    vector_groups[prefix].append((bit_name, bit_pos, reg_name))
        
        added_prefixes = set()
        for prefix, fields in vector_groups.items():
            if len(fields) > 1 and prefix not in added_prefixes:
                
                reg_name = reg.get('name')
                reg_wr = reg.get('wr')
                if reg_wr == "r":
                    direction = "I"
                else:
                    direction = "O"

                width = len(fields)
                file.write(f"`define {block_name.upper()}_{prefix.upper()}_{direction}_WIDTH {width}\n")
                added_prefixes.add(prefix)
       
        file.write("\n")
        
        # --------------------------- BIT POSITION ---------------
        file.write("// --------------------------\n")
        file.write("// Register Bit Positions\n")
        file.write("// --------------------------\n")
        file.write("\n")
 
        for reg in regs:
            reg_name = reg.get('name')
            file.write(f"//---------------- {reg_name.upper()} -----------\n")

            for field in reg.findall('Field'):
                bit_name = field.get('bit_name')
                bit_pos = field.get('bit_position')
                file.write(f"`define {block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS {bit_pos}\n")
            
            file.write("\n")
        



#---------------------------- CONFIGURATION STATUS REGISTER  -------------------------
def csr(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError("block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width']:
            continue
        regs.append(reg)

    vector_groups_by_reg = {}
    individual_fields_by_reg = {}
    
    for reg in regs:
        reg_name = reg.get('name')
        reg_wr = reg.get('wr')
        fields = reg.findall('Field')
        
        if reg_wr != "wr":
            individual_fields_by_reg[reg_name] = [(f.get('bit_name'), f.get('bit_position')) for f in fields]
            vector_groups_by_reg[reg_name] = {}
            continue
            
        prefix_groups = defaultdict(list)
        individual = []
        
        for field in fields:
            bit_name = field.get('bit_name')
            bit_pos = field.get('bit_position')
            prefix = bit_name.rstrip('0123456789')
            if prefix and prefix != bit_name:
                prefix_groups[prefix].append((bit_name, bit_pos))
            else:
                individual.append((bit_name, bit_pos))
        
        vector_groups = {}
        for prefix, group in prefix_groups.items():
            if len(group) > 1:
                vector_groups[prefix] = group
            else:
                individual.extend(group)
        
        vector_groups_by_reg[reg_name] = vector_groups
        individual_fields_by_reg[reg_name] = individual

    with open(f"rtl/{block_name.lower()}_csr.v", "w", encoding="utf-8") as file:
        file.write(f"`include \"{block_name.lower()}_defines.v\"\n")
        file.write("\n")
        file.write(f"module {block_name.lower()}_csr\n")
        file.write("(\n")
        file.write("\n")

        bus_width_text = f"`{block_name.upper()}_DATA_WIDTH-1:0"
        addr_width_text = f"`{block_name.upper()}_ADDR_WIDTH-1:0"

        ports = [
            ("input",     "",                     "pclk",      ","),
            ("input",     "",                     "preset_n",  ","),
            ("input",     "",                     "psel_i",    ","),
            ("input",     "",                     "pwrite_i",  ","),
            ("input",     "",                     "penable_i", ","),
            ("input",     f"[{addr_width_text}]", "paddr_i",   ","),
            ("input",     f"[{bus_width_text}]",  "pwdata_i",  ","),
            ("output reg", f"[{bus_width_text}]", "prdata_o",  ","),
            ("output reg", "",                    "pready_o",  ","),
            ("output reg", "",                    "pslverr_o", ",") 
        ]

        for direction, bus, name, comma in ports:
            file.write(f"{direction:<12} {bus:<45} {name}{comma}\n")

        field_ports = []
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            
            if reg_wr == "wr":
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        field_ports.append(("output", f"[`{block_name.upper()}_{prefix.upper()}_O_WIDTH-1:0]", f"{prefix.lower()}_o", ","))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("output", "", f"{bit_name.lower()}_o", ","))
            else:
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        field_ports.append(("input", f"[`{block_name.upper()}_{prefix.upper()}_I_WIDTH-1:0]", f"{prefix.lower()}_o", ","))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("input", "", f"{bit_name.lower()}_i", ","))
        
        if field_ports:
            last = field_ports[-1]
            field_ports[-1] = (last[0], last[1], last[2], "")
        
        for direction, bus, name, comma in field_ports:
            file.write(f"{direction:<12} {bus:<45} {name}{comma}\n")

        file.write(");\n")
        file.write("\n")
        file.write("wire wr_enb;\n")
        file.write("wire rd_enb;\n")
        file.write("wire addr_valid;\n")
        file.write("\n")
        file.write("localparam APB_IDLE   = 2'b00;\n")
        file.write("localparam APB_SETUP  = 2'b01;\n")
        file.write("localparam APB_ENABLE = 2'b10;\n\n")
        file.write("reg [1:0] apb_present_state;\n")
        file.write("reg [1:0] apb_next_state;\n")
        file.write("\n")
 
        for reg in regs:
            reg_name = reg.get('name')
            file.write(f"reg  [`{block_name.upper()}_REG_WIDTH-1:0] {reg_name.lower()}_reg;\n")

        file.write("\n")
        file.write("assign wr_enb = psel_i && penable_i && pwrite_i;\n")
        file.write("assign rd_enb = psel_i && penable_i && !pwrite_i;\n")
        file.write("\n")
        
        file.write("assign addr_valid = (")   
        for i, reg in enumerate(regs):
            reg_name = reg.get('name')
            if i > 0:
                file.write(" ||\n                    ")
            file.write(f"(paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR)")
        file.write(");\n")
        file.write("\n")

        file.write("//----------------------------------------------------------------------\n")
        file.write("// APB state machine\n")
        file.write("//----------------------------------------------------------------------\n")
        file.write("always @(posedge pclk or negedge preset_n)\n")
        file.write("begin\n")
        file.write("   if (preset_n == 1'b0)\n")
        file.write("   begin\n")
        file.write("      apb_present_state <= APB_IDLE;\n")
        file.write("   end\n")
        file.write("\n")
        file.write("   else\n")
        file.write("   begin\n")
        file.write("      apb_present_state <= apb_next_state;\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        file.write("always @(*)\n")
        file.write("begin\n")
        file.write("// APB IDLE PHASE\n")
        file.write("   if (apb_present_state == APB_IDLE)\n")
        file.write("   begin\n")
        file.write("      if (!psel_i)\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_IDLE;\n")
        file.write("      end\n")
        file.write("\n")
        file.write("      else\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_SETUP;\n")
        file.write("      end\n")
        file.write("   end\n")
        file.write("// APB SETUP PHASE\n")
        file.write("   else if (apb_present_state == APB_SETUP)\n")
        file.write("   begin\n")
        file.write("      if (psel_i && !penable_i)\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_SETUP;\n")
        file.write("      end\n")
        file.write("\n")
        file.write("      else if (psel_i && penable_i)\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_ENABLE;\n")
        file.write("      end\n")
        file.write("\n")
        file.write("      else\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_IDLE;\n")
        file.write("      end\n")
        file.write("   end\n")
        file.write("// APB ENABLE PHASE\n")
        file.write("   else if (apb_present_state == APB_ENABLE)\n")
        file.write("   begin\n")
        file.write("      if (psel_i && penable_i)\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_ENABLE;\n")
        file.write("      end\n")
        file.write("\n")
        file.write("      else if (psel_i && !penable_i)\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_SETUP;\n")
        file.write("      end\n")
        file.write("\n")
        file.write("      else\n")
        file.write("      begin\n")
        file.write("         apb_next_state = APB_IDLE;\n")
        file.write("      end\n")
        file.write("   end\n")
        file.write("   \n")
        file.write("   else\n")
        file.write("   begin\n")
        file.write("      apb_next_state = APB_IDLE;\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        file.write("always @(*)\n")
        file.write("begin\n")
        file.write("   if (apb_present_state == APB_ENABLE)\n")
        file.write("   begin\n")
        file.write("      pready_o = 1'b1;\n")
        file.write("   end\n")
        file.write("\n")
        file.write("   else\n")
        file.write("   begin\n")
        file.write("      pready_o = 1'b0;\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        file.write("\n")
        file.write("always @(*)\n")
        file.write("begin\n")
        file.write("   if (apb_present_state == APB_ENABLE)\n")
        file.write("   begin\n")
        file.write("      pslverr_o = ~addr_valid;\n")
        file.write("   end\n")
        file.write("\n")
        file.write("   else\n")
        file.write("   begin\n")
        file.write("      pslverr_o = 1'b0;\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        file.write("\n")

        file.write("//----------------------------------------------------------------------\n")
        file.write("// Register writes (APB -> reg)\n")
        file.write("//----------------------------------------------------------------------\n")
        file.write("always @(posedge pclk or negedge preset_n)\n")
        file.write("begin\n")
        file.write("   if (preset_n == 1'b0)\n")
        file.write("   begin\n")
        
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            if reg_wr != "wr":
                continue
            reg_name = reg.get('name')
            file.write(f"      {reg_name.lower()}_reg <= `{block_name.upper()}_{reg_name.upper()}_RST;\n")
        
        file.write("   end\n")
        file.write("   \n")
        file.write("   else\n")
        file.write("   begin\n")
        file.write("      if (wr_enb)\n")
        file.write("      begin\n")
        
        first_wr = True
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            if reg_wr != "wr":
                continue
            if first_wr:
                file.write(f"         if (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR)\n")
                first_wr = False
            else:
                file.write(f"         else if (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR)\n")
            file.write("         begin\n")
            file.write(f"            {reg_name.lower()}_reg <= pwdata_i;\n".format(reg_name=reg_name))
            file.write("         end\n")
        
        file.write("      end\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        
        file.write("//----------------------------------------------------------------------\n")
        file.write("// Read-only register  (inputs -> reg)\n")
        file.write("//----------------------------------------------------------------------\n")
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            if reg_wr == "wr":
                continue
            file.write("always @(*)\n")
            file.write("begin\n")
            file.write(f"   {reg_name.lower()}_reg = {{`{block_name.upper()}_REG_WIDTH{{1'b0}}}};\n")
            for field in reg.findall('Field'):
                bit_name = field.get('bit_name')
                bit_pos = field.get('bit_position')
                file.write(f"   {reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS] = {bit_name.lower()}_i;\n")
            file.write("end\n")
            file.write("\n")

        file.write("//----------------------------------------------------------------------\n")
        file.write("// Register reads (reg -> APB)\n")
        file.write("//----------------------------------------------------------------------\n")
        file.write("always @(*)\n")
        file.write("begin\n")
        
        for i, reg in enumerate(regs):
            reg_name = reg.get('name')
            if i == 0:
                file.write(f"   if (rd_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
            else:
                file.write(f"   else if (rd_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
            file.write("   begin\n")
            file.write(f"      prdata_o = {reg_name.lower()}_reg;\n")
            file.write("   end\n")
        
        file.write("   else\n")
        file.write("   begin\n")
        file.write(f"      prdata_o = {{`{block_name.upper()}_DATA_WIDTH{{1'b0}}}};\n")
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        file.write("\n")

        file.write("//----------------------------------------------------------------------\n")
        file.write("// Field assignments\n")
        file.write("//----------------------------------------------------------------------\n")
        
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            if reg_wr != "wr":
                continue
            
            for prefix, fields in vector_groups_by_reg[reg_name].items():
                if len(fields) > 1:
                    sorted_fields = sorted(fields, key=lambda x: int(re.search(r'h([0-9A-Fa-f]+)', x[1]).group(1), 16) if re.search(r'h([0-9A-Fa-f]+)', x[1]) else 0, reverse=True)
                    concat_parts = []
                    for bit_name, bit_pos in sorted_fields:
                        concat_parts.append(f"{reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS]")
                    concat_str = ", ".join(concat_parts)
                    file.write(f"assign {prefix.lower()}_o = {{{concat_str}}};\n")
            
            for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                file.write(f"assign {bit_name.lower()}_o = {reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS];\n")
       
        
        file.write("\n")
        file.write("endmodule\n")

# ------------------------- TOP BLOCK ------------------------
def top_level(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError("block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width']:
            continue
        regs.append(reg)

    vector_groups_by_reg = {}
    individual_fields_by_reg = {}
    
    for reg in regs:
        reg_name = reg.get('name')
        reg_wr = reg.get('wr')
        fields = reg.findall('Field')
        
        if reg_wr != "wr":
            individual_fields_by_reg[reg_name] = [(f.get('bit_name'), f.get('bit_position')) for f in fields]
            vector_groups_by_reg[reg_name] = {}
            continue
            
        prefix_groups = defaultdict(list)
        individual = []
        
        for field in fields:
            bit_name = field.get('bit_name')
            bit_pos = field.get('bit_position')
            prefix = bit_name.rstrip('0123456789')
            if prefix and prefix != bit_name:
                prefix_groups[prefix].append((bit_name, bit_pos))
            else:
                individual.append((bit_name, bit_pos))
        
        vector_groups = {}
        for prefix, group in prefix_groups.items():
            if len(group) > 1:
                vector_groups[prefix] = group
            else:
                individual.extend(group)
        
        vector_groups_by_reg[reg_name] = vector_groups
        individual_fields_by_reg[reg_name] = individual

    with open(f"rtl/{block_name.lower()}_top_block.v", "w", encoding="utf-8") as file:
        file.write(f"`include \"{block_name.lower()}_defines.v\"\n")
        file.write("\n")
        file.write(f"module {block_name.lower()}_top_block\n")
        file.write("(\n")
        file.write("\n")

        bus_width_text = f"`{block_name.upper()}_DATA_WIDTH-1:0"
        addr_width_text = f"`{block_name.upper()}_ADDR_WIDTH-1:0"

        ports = [
            ("input",  "",                     "pclk",     ","),
            ("input",  "",                     "preset_n", ","),
            ("input",  "",                     "psel",     ","),
            ("input",  "",                     "pwrite",   ","),
            ("input",  "",                     "penable",  ","),
            ("input",  f"[{addr_width_text}]", "paddr",    ","),
            ("input",  f"[{bus_width_text}]",  "pwdata",   ","),
            ("output", f"[{bus_width_text}]",  "prdata",   ","),
            ("output", "",                     "pready",   ","),
            ("output", "",                     "pslvrr",   ",") 
        ]

        for direction, bus, name, comma in ports:
            file.write(f"{direction:<7} {bus:<45} {name}{comma}\n")

        field_ports = []
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            
            if reg_wr == "wr":
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        field_ports.append(("output", f"[`{block_name.upper()}_{prefix.upper()}_O_WIDTH-1:0]", prefix.lower(), ","))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("output", "", bit_name.lower(), ","))
            else:
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        field_ports.append(("input", f"[`{block_name.upper()}_{prefix.upper()}_I_WIDTH-1:0]", prefix.lower(), ","))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("input", "", bit_name.lower(), ","))
        
        if field_ports:
            last = field_ports[-1]
            field_ports[-1] = (last[0], last[1], last[2], "")
        
        for direction, bus, name, comma in field_ports:
            file.write(f"{direction:<7} {bus:<45} {name}{comma}\n")

        file.write(");\n") 
        file.write("\n")

        field_ports = []
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
            
            if reg_wr == "wr":
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        field_ports.append(("wire", f"[`{block_name.upper()}_{prefix.upper()}_O_WIDTH-1:0]", f"{prefix.lower()}_w", ";"))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("wire", "", f"{bit_name.lower()}_w", ";"))
        
        for direction, bus, name, comma in field_ports:
            file.write(f"{direction:<7} {bus:<45} {name}{comma}\n")


        file.write("\n")
        file.write("\n")
        
        file.write(f"{block_name.lower()}_csr    {block_name.lower()}_csr_block\n")
        file.write("(\n")
        file.write(".pclk        (pclk),\n")
        file.write(".preset_n    (preset_n),\n")
        file.write(".psel_i      (psel),\n")
        file.write(".pwrite_i    (pwrite),\n")
        file.write(".penable_i   (penable),\n")
        file.write(".paddr_i     (paddr),\n")
        file.write(".pwdata_i    (pwdata),\n")
        file.write(".prdata_o    (prdata),\n")
        file.write(".pready_o    (pready),\n")
        file.write(".pslverr_o   (pslvrr),\n")
        
        instance_conns = []
        for reg in regs:
            reg_name = reg.get('name')
            reg_wr = reg.get('wr')
         
            if reg_wr == "r":
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        instance_conns.append((f".{prefix.lower()}_i", f"({prefix.lower()}_w)"))

                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    instance_conns.append((f".{bit_name.lower()}_i", f"({bit_name.lower()}_w)"))
            else:
                for prefix, fields in vector_groups_by_reg[reg_name].items():
                    width = len(fields)
                    if width > 1:
                        instance_conns.append((f".{prefix.lower()}_o", f"({prefix.lower()}_w)"))

                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    instance_conns.append((f".{bit_name.lower()}_o", f"({bit_name.lower()}_w)"))

        
        if instance_conns:
            last_conn = instance_conns[-1]
            instance_conns[-1] = (last_conn[0], last_conn[1])
        
        for i, (pin, conn) in enumerate(instance_conns):
            comma = "," if i < len(instance_conns) - 1 else ""
            file.write(f"{pin:<12} {conn}{comma}\n")

        file.write(");\n")
        file.write("\n")
        file.write("endmodule\n")



#---------------------------- main -----------------------------------------------
def main():

    print("------------------------------------------")
    print("******************************************")
    print("Configuration Status Register (APB)")
    print("******************************************")
    print("------------------------------------------")
    print()
    print("Select Mode : ")
    print("              1. Generate XML Template")
    print("              2. Generate RTL Code ")
    print()
    mode = input("Enter Choice [1/2] : ").strip()

    if mode == "1":
        template()
        print("Template generated: sample.xml")
    elif mode == "2":
        xml_file = input("Enter XML file path: ").strip()
        rtl(xml_file)
        print(f"RTL generated in rtl/ folder:")
        print(f"  - rtl/{os.path.splitext(os.path.basename(xml_file))[0]}_defines.v")
        print(f"  - rtl/{os.path.splitext(os.path.basename(xml_file))[0]}_csr.v")
        print(f"  - rtl/{os.path.splitext(os.path.basename(xml_file))[0]}_top_block.v")
    else:
        print("ERROR : Invalid Choice")
        sys.exit(1)

if __name__ == "__main__":
    main()
