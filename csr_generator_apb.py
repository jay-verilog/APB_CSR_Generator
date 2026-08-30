import os
import xml.etree.ElementTree as ET

file_path = input("Enter the path to your XML file: ").strip()


# ---------------------------- Template ----------------------------------------------
def template():
    with open("sample.xml", "w", encoding="utf-8") as file:
        file.write()
        file.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        file.write("<?xml-stylesheet type=\"text/css\" href=\"style.css\"?>")
        file.write()
        file.write("<Register_Map>")
        file.write("    <block_name     block_name = \"\"> </data_width>  <!-- block should in lower_case -->")
        file.write("    <data_width     data_width = \"\"> </data_width>")
        file.write("    <address_width  addr_width = \"\"> </address_width>")
        file.write("    <register_width reg_width  = \"\"> </register_width>")
        file.write("   ")
        file.write()
        file.write()
        file.write("<!-- Register Map -->")
        file.write("    <Register_NAME")
        file.write("        name    = \"NAME1\"   ")
        file.write("        address = \"'h\"")
        file.write("        reset   = \"'h\"")
        file.write("        wr      = \"\">   <!-- \"wr\" = wirte and read. \"r\" = read only.  -->")
        file.write("        <Field name = \"\"   bits=\"3'b111\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b110\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b101\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b100\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b011\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b010\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b001\"/>")
        file.write("        <Field name = \"\"   bits=\"3'b000\"/>")
        file.write("    </Register_NAME>")
        file.write()
        file.write("</Register_Map>")
        file.write()
        file.write()
        file.write("<!-- EXAMPLE")
        file.write()
        file.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        file.write("<?xml-stylesheet type=\"text/css\" href=\"style.css\"?>")
        file.write()
        file.write("<Register_Map>")
        file.write("    <block_name     block_name = \"spi\"> </data_width>  ")
        file.write("    <data_width     data_width = \"8\">   </data_width>")
        file.write("    <address_width  addr_width = \"3\">   </address_width>")
        file.write("    <register_width reg_width  = \"8\">   </register_width>")
        file.write()
        file.write()
        file.write("    <Register_SPI_CONTROL_REGISTER")
        file.write("        name    = \"SPI_CONTROL_REGISTER1\"")
        file.write("        address = \"8'b0000_0000\"")
        file.write("        reset   = \"8'b0000_0100\"")
        file.write("        wr      = \"wr\">")
        file.write("        <Field name=\"SPIE\"   bits=\"3'b111\"/>")
        file.write("        <Field name=\"SPE\"    bits=\"3'b110\"/>")
        file.write("        <Field name=\"SPTIE\"  bits=\"3'b101\"/>")
        file.write("        <Field name=\"MSTR\"   bits=\"3'b100\"/>")
        file.write("        <Field name=\"CPOL\"   bits=\"3'b011\"/>")
        file.write("        <Field name=\"CPHA\"   bits=\"3'b010\"/>")
        file.write("        <Field name=\"SSOE\"   bits=\"3'b001\"/>")
        file.write("        <Field name=\"LSBFE\"  bits=\"3'b000\"/>")
        file.write("    </Register_SPI_CONTROL_REGISTER>")
        file.write()
        file.write("    <Register_SPI_CONTROL_REGISTER2")
        file.write("        name    = \"SPI_CONTROL_REGISTER2\"")
        file.write("        address = \"8'b0000_0001\"")
        file.write("        reset   = \"8'b0000_0000\"")
        file.write("        wr      = \"wr\">")
        file.write("        <Field name=\"MODFEN\"   bits=\"3'b100\"/>")
        file.write("        <Field name=\"BIDIROE\"  bits=\"3'b011\"/>")
        file.write("        <Field name=\"SPISWAI\"  bits=\"3'b001\"/>")
        file.write("        <Field name=\"SPC0\"     bits=\"3'b000\"/>")
        file.write("    </Register_SPI_CONTROL_REGISTER2>")
        file.write()
        file.write("    <Register_SPI_BAUD_RATE_REGISTER")
        file.write("        name    = \"SPI_BAUD_RATE_REGISTER\"")
        file.write("        address = \"8'b0000_0010\"")
        file.write("        reset   = \"8'b0000_0000\"")
        file.write("        wr      = \"wr\">")
        file.write("        <Field name=\"SPPR2\" bits=\"3'b110\"/>")
        file.write("        <Field name=\"SPPR1\" bits=\"3'b101\"/>")
        file.write("        <Field name=\"SPPR0\" bits=\"3'b100\"/>")
        file.write("        <Field name=\"SPR2\"  bits=\"3'b010\"/>")
        file.write("        <Field name=\"SPR1\"  bits=\"3'b001\"/>")
        file.write("        <Field name=\"SPR0\"  bits=\"3'b000\"/>")
        file.write("    </Register_SPI_BAUD_RATE_REGISTER>")
        file.write()
        file.write("    <Register_SPI_STATUS_REGISTER")
        file.write("        name    = \"SPI_STATUS_REGISTER\"")
        file.write("        address = \"8'b0000_0011\"")
        file.write("        reset   = \"8'b0010_0000\"")
        file.write("        wr      = \"r\">")
        file.write("        <Field name=\"SPIF\"  bits=\"3'b111\"/>")
        file.write("        <Field name=\"SPTEF\" bits=\"3'b101\"/>")
        file.write("        <Field name=\"MODF\"  bits=\"3'b100\"/>")
        file.write("    </Register_SPI_STATUS_REGISTER>")
        file.write()
        file.write("    <Register_SPI_DATA_REGISTER")
        file.write("        name    = \"SPI_DATA_REGISTER\"")
        file.write("        address = \"8'b0000_0100\"")
        file.write("        reset   = \"8'b0000_0000\"")
        file.write("        wr      = \"wr\">")
        file.write("        <Field name=\"BIT7\" bits=\"3'b111\"/>")
        file.write("        <Field name=\"BIT6\" bits=\"3'b110\"/>")
        file.write("        <Field name=\"BIT5\" bits=\"3'b101\"/>")
        file.write("        <Field name=\"BIT4\" bits=\"3'b100\"/>")
        file.write("        <Field name=\"BIT3\" bits=\"3'b011\"/>")
        file.write("        <Field name=\"BIT2\" bits=\"3'b010\"/>")
        file.write("        <Field name=\"BIT1\" bits=\"3'b001\"/>")
        file.write("        <Field name=\"BIT0\" bits=\"3'b000\"/>")
        file.write("    </Register_SPI_DATA_REGISTER> ")
        file.write("</Register_Map>")
        file.write()
        file.write("-->")



def rtl():    
    defines()
    crs()
    top_level()

#------------------------------ DEFINES -------------------------
def defines(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_name     = root.find('block_name').get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError(
            "block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    file.write("//-------------------------------------------------------------------------")
    file.write("//// {block_name.upper()} Register Map - Auto-generated Verilog Defines    ")
    file.write("//-------------------------------------------------------------------------")
    file.write()
    file.write("`define {block_name.upper()}_DATA_BUS_WIDTH {data_width}")
    file.write("`define {block_name.upper()}_ADDR_BUS_WIDTH {addr_width}")
    file.write("`define {block_name.upper()}_REG_BUS_WIDTH  {reg_width}")
    file.write()
    file.write("// Register Reset Values")
    file.write()



    file.write()
#---------------------------- CONFIGURATION STATUS REGISTER  -------------------------
def csr(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_name     = root.find('block_name').get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError(
            "block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    with open("{block_name.lower()}_top_block.v", "w", encoding="utf-8") as file:
        file.write("`include \"{block_name.lower()_defines.v\"")
        file.write()
        file.write("module {block_name.lower()}_csr")
        file.write("(")
        file.write()

        bus_width_text = f"`{block_name.upper()}_DATA_BUS_WIDTH-1:0"
        addr_width_text = f"`{block_name.upper()}_ADDR_BUS_WIDTH-1:0"

        ports =
        [
            ("input",  "",               "pclk",     ","),
            ("input",  "",               "preset_n", ","),
            ("input",  "",               "psel_i",   ","),
            ("input",  "",               "pwrite_i", ","),
            ("input",  "",               "penable_i",","),
            ("input",  f"[{addr_width_text}]", "paddr_i",  ","),
            ("input",  f"[{bus_width_text}]",  "pwdata_i", ","),
            ("output", f"[{bus_width_text}]",  "prdata_o", ","),
            ("output", "",               "pready_o", ","),
            ("output", "",               "pslverr_o", ",") 
        ]

  
        for direction, bus, name, comma in ports:
            file.write(f"    {direction:<7} {bus:<45} {name}{comma}\n")

        for reg in root:
            if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width']:
                continue
        
            reg_wr = reg.get('wr')

            # read
            if reg_wr == "wr":
                direction = "output"
            elif reg_wr == "r":
                direction = "input"
    
   
            for field in reg.findall('Field'):
                bit_name = field.get('bit_name')
               #bit_pos = field.get('bit_position')
                file.write(f"    {direction:<7} {'':<45} {bit_name},\n")

           file.write(");")
  

        file.write("wire wr_enb;")
        file.write("wire rd_enb;")
        file.write("wire addr_valid;")

        file.write("localparam APB_IDLE   = 2'b00;")
        file.write("localparam APB_SETUP  = 2'b01;")
        file.write("localparam APB_ENABLE = 2'b10;")
        file.write("reg [1:0] apb_present_state;")
        file.write("reg [1:0] apb_next_state;")
  

# TODO REG DECLARATION

        file.write("assign wr_enb = psel_i && penable_i && pwrite_i;")
        file.write("assign rd_enb = psel_i && penable_i && !pwrite_i;")

# TODO ADDR VALID

        file.write("assign addr_valid =")


        file.write("//----------------------------------------------------------------------")
        file.write("// APB state machine")
        file.write("//----------------------------------------------------------------------")
        file.write("always @(posedge pclk or negedge preset_n)")
        file.write("begin")
        file.write("   if (preset_n == 1'b0)")
        file.write("   begin")
        file.write("      apb_present_state <= APB_IDLE;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      apb_present_state <= apb_next_state;")
        file.write("   end")
        file.write("end")
        file.write("")
        file.write("always @(*)")
        file.write("begin")
        file.write("// APB IDLE PHASE")
        file.write("   if (apb_present_state == APB_IDLE)")
        file.write("   begin")
        file.write("   if (!psel_i)")
        file.write("   begin")
        file.write("      apb_next_state = APB_IDLE;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      apb_next_state = APB_SETUP;")
        file.write("   end")
        file.write("   end")
        file.write("// APB SETUP PHASE")
        file.write("   else if (apb_present_state == APB_SETUP)")
        file.write("   begin")
        file.write("   if (psel_i && !penable_i)")
        file.write("   begin")
        file.write("      apb_next_state = APB_SETUP;")
        file.write("   end")
        file.write("")
        file.write("   else if (psel_i && penable_i)")
        file.write("   begin")
        file.write("      apb_next_state = APB_ENABLE;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      apb_next_state = APB_IDLE;")
        file.write("   end")
        file.write("   end")
        file.write("// APB ENABLE PHASE")
        file.write("   else if (apb_present_state == APB_ENABLE)")
        file.write("   begin")
        file.write("   if (psel_i && penable_i)")
        file.write("   begin")
        file.write("      apb_next_state = APB_ENABLE;")
        file.write("   end")
        file.write("")
        file.write("   else if (psel_i && !penable_i)")
        file.write("   begin")
        file.write("      apb_next_state = APB_SETUP;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      apb_next_state = APB_IDLE;")
        file.write("   end")
        file.write("   end")
        file.write("   ")
        file.write("   else")
        file.write("   begin")
        file.write("      apb_next_state = APB_IDLE;")
        file.write("   end")
        file.write("end")
        file.write("")
        file.write("always @(*)")
        file.write("begin")
        file.write("   if (apb_present_state == APB_ENABLE)")
        file.write("   begin")
        file.write("      pready_o = 1'b1;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      pready_o = 1'b0;")
        file.write("   end")
        file.write("end")
        file.write("")
        file.write("")
        file.write("always @(*)")
        file.write("begin")
        file.write("   if (apb_present_state == APB_ENABLE)")
        file.write("   begin")
        file.write("      pslverr_o = ~addr_valid;")
        file.write("   end")
        file.write("")
        file.write("   else")
        file.write("   begin")
        file.write("      pslverr_o = 1'b0;")
        file.write("   end")
        file.write("end")
        file.write()
        file.write()

        file.write("endmodule")


# ------------------------- TOP BLOCK ------------------------
def top_level():
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_name     = root.find('block_name').get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError(
            "block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')

    with open("{block_name.lower()}_top_block.v", "w", encoding="utf-8") as file:
        file.write("`include \"{block_name.lower()_defines.v\"")
        file.write()
        file.write("module {block_name.lower()}_top_block")
        file.write("(")
        file.write()

        bus_width_text = f"`{block_name.upper()}_DATA_BUS_WIDTH-1:0"
        addr_width_text = f"`{block_name.upper()}_ADDR_BUS_WIDTH-1:0"

        ports =
        [
        ("input",  "",               "pclk",     ","),
        ("input",  "",               "preset_n", ","),
        ("input",  "",               "psel_i",   ","),
        ("input",  "",               "pwrite_i", ","),
        ("input",  "",               "penable_i",","),
        ("input",  f"[{addr_width_text}]", "paddr_i",  ","),
        ("input",  f"[{bus_width_text}]",  "pwdata_i", ","),
        ("output", f"[{bus_width_text}]",  "prdata_o", ","),
        ("output", "",               "pready_o", ","),
        ("output", "",               "pslverr_o", "") 
        ]

        for direction, bus, name, comma in ports:
            file.write(f"    {direction:<7} {bus:<45} {name}{comma}\n")

        for reg in root:
            if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width']:
                continue
        
    
            for field in reg.findall('Field'):
                bit_name = field.get('bit_name')
               #bit_pos = field.get('bit_position')
                file.write(f"wire  {bit_name},\n")


    file.write("endmodule")



#---------------------------- main -----------------------------------------------
def main():
   print("------------------------------------------"
   print("******************************************")
   print("Configuration Status Register(APB)")
   print("******************************************")
   print("------------------------------------------"

   print("Select Mode : ")
   print("              1. Generate XML Template")
   print("              2. Generate RTL Code ")

   mode = input("Enter Choice [1/2] : ").strip()

   if mode == "1"
       template()

   elif mode == "2"
       rtl()

   else:
       print("ERROR : Invalid Choice")
       sys.exit(1)

if __name__ == "__main__":
    main()



