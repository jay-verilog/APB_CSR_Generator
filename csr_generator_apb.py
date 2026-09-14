import os
import sys
import xml.etree.ElementTree as ET
import re
from collections import defaultdict



# ---------------------------- Document ----------------------------------------------
def doc (xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError("block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')
    base_address   = root.find('base_address').get('base_addr')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width', 'base_address']:
            continue
        regs.append(reg)

    register_width_int = int(register_width)

    with open(f"{block_name.lower()}_doc.html", "w", encoding="utf-8") as file:
        file.write("<!DOCTYPE html>\n")
        file.write("<html lang=\"en\">\n")
        file.write("\n")
        file.write("<head>\n")
        file.write("\n")
        file.write("    <meta charset=\"UTF-8\">\n")
        file.write("\n")
        file.write("    <meta name=\"viewport\"\n")
        file.write("          content=\"width=device-width, initial-scale=1.0\">\n")
        file.write("\n")
        file.write(f"    <title>{block_name.upper()} IP Block</title>\n")
        file.write("\n")
        file.write("    <style>\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           BODY\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        * {\n")
        file.write("            box-sizing: border-box;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        body {\n")
        file.write("            font-family: Arial, Helvetica, sans-serif;\n")
        file.write("            background-color: #f4f6f8;\n")
        file.write("            margin: 0;\n")
        file.write("            padding: 30px;\n")
        file.write("            color: #222;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           HEADINGS\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        h1 {\n")
        file.write("            text-align: center;\n")
        file.write("            color: #1f2937;\n")
        file.write("            margin-bottom: 35px;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        h2 {\n")
        file.write("            margin-top: 40px;\n")
        file.write("            color: #374151;\n")
        file.write("            border-bottom: 3px solid #b7c3dd;\n")
        file.write("            padding-left: 10px;\n")
        file.write("            padding-bottom: 5px;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           NORMAL TABLE\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        table {\n")
        file.write("            width: 100%;\n")
        file.write("            border-collapse: collapse;\n")
        file.write("            background-color: white;\n")
        file.write("            margin-bottom: 25px;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        th,\n")
        file.write("        td {\n")
        file.write("            border: 1px solid #d1d5db;\n")
        file.write("            padding: 10px;\n")
        file.write("            text-align: left;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        th {\n")
        file.write("            background-color: #1f2937;\n")
        file.write("            color: white;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           ADDRESS\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        addr {\n")
        file.write("            background-color: #f3f4f6;\n")
        file.write("            padding: 4px 8px;\n")
        file.write("            border-radius: 4px;\n")
        file.write("            font-family: \"Courier New\", monospace;\n")
        file.write("            color: #b91c1c;\n")
        file.write("            white-space: nowrap;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           LINKS\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        a {\n")
        file.write("            color: #2563eb;\n")
        file.write("            text-decoration: none;\n")
        file.write("            font-weight: bold;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        a:hover {\n")
        file.write("            text-decoration: underline;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           REGISTER HEADER\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        .register-header {\n")
        file.write("            width: 100%;\n")
        file.write("\n")
        file.write("            background-color: #1f2937;\n")
        file.write("            color: white;\n")
        file.write("\n")
        file.write("            padding: 16px 20px;\n")
        file.write("\n")
        file.write("            display: flex;\n")
        file.write("            align-items: center;\n")
        file.write("            justify-content: space-between;\n")
        file.write("\n")
        file.write("            gap: 15px;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        .register-name {\n")
        file.write("            font-size: 18px;\n")
        file.write("            font-weight: bold;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        .register-offset {\n")
        file.write("            background-color: #60a5fa;\n")
        file.write("            color: #111827;\n")
        file.write("\n")
        file.write("            padding: 7px 12px;\n")
        file.write("\n")
        file.write("            border-radius: 5px;\n")
        file.write("\n")
        file.write("            font-family: \"Courier New\", monospace;\n")
        file.write("            font-size: 16px;\n")
        file.write("            font-weight: bold;\n")
        file.write("\n")
        file.write("            white-space: nowrap;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           32 BIT TABLE\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        .bit-table {\n")
        file.write("            width: 100%;\n")
        file.write("            table-layout: fixed;\n")
        file.write("            border-collapse: collapse;\n")
        file.write("\n")
        file.write("            background-color: white;\n")
        file.write("\n")
        file.write("            margin-top: 15px;\n")
        file.write("            margin-bottom: 25px;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* BIT NUMBER */\n")
        file.write("\n")
        file.write("        .bit-table th {\n")
        file.write("            border: 1px solid #d1d5db;\n")
        file.write("\n")
        file.write("            padding: 8px 0;\n")
        file.write("\n")
        file.write("            text-align: center;\n")
        file.write("\n")
        file.write("            font-size: 12px;\n")
        file.write("\n")
        file.write("            white-space: normal;\n")
        file.write("            word-break: break-word;\n")
        file.write("            line-height: 1.15;\n")
        file.write("\n")
        file.write("            background-color: #1f2937;\n")
        file.write("            color: white;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* DATA31, DATA30, etc. */\n")
        file.write("\n")
        file.write("        .bit-table td {\n")
        file.write("            border: 1px solid #d1d5db;\n")
        file.write("\n")
        file.write("            padding: 8px 0;\n")
        file.write("\n")
        file.write("            text-align: center;\n")
        file.write("\n")
        file.write("            font-size: 9px;\n")
        file.write("\n")
        file.write("            white-space: nowrap;\n")
        file.write("\n")
        file.write("            overflow: hidden;\n")
        file.write("        }\n")
        file.write("\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           LAPTOP 1366 / 1440\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        @media (max-width: 1440px) {\n")
        file.write("\n")
        file.write("            body {\n")
        file.write("                padding: 25px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table th {\n")
        file.write("                font-size: 12px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table td {\n")
        file.write("                font-size: 9px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-name {\n")
        file.write("                font-size: 18px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-offset {\n")
        file.write("                font-size: 15px;\n")
        file.write("            }\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           SMALL LAPTOP\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        @media (max-width: 1200px) {\n")
        file.write("\n")
        file.write("            body {\n")
        file.write("                padding: 21px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table th {\n")
        file.write("                font-size: 11px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table td {\n")
        file.write("                font-size: 8px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-name {\n")
        file.write("                font-size: 16px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-offset {\n")
        file.write("                font-size: 14px;\n")
        file.write("            }\n")
        file.write("        }\n")
        file.write("\n")
        file.write("        /* =========================\n")
        file.write("           VERY SMALL SCREEN\n")
        file.write("        ========================= */\n")
        file.write("\n")
        file.write("        @media (max-width: 900px) {\n")
        file.write("\n")
        file.write("            body {\n")
        file.write("                padding: 11px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table th {\n")
        file.write("                font-size: 10px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .bit-table td {\n")
        file.write("                font-size: 7px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-header {\n")
        file.write("                padding: 13px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-name {\n")
        file.write("                font-size: 14px;\n")
        file.write("            }\n")
        file.write("\n")
        file.write("            .register-offset {\n")
        file.write("                font-size: 12px;\n")
        file.write("            }\n")
        file.write("        }\n")
        file.write("\n")
        file.write("    </style>\n")
        file.write("</head>\n")
        file.write("\n")
        file.write("\n")
        file.write("<body>\n")
        file.write("\n")
        file.write("\n")
        file.write(f"    <h1>{block_name.upper()} IP Block</h1>\n")
        file.write("\n")
        file.write("    <!-- =========================\n")
        file.write("         IP INFORMATION\n")
        file.write("    ========================== -->\n")
        file.write("\n")
        file.write("    <table>\n")
        file.write("\n")
        file.write("        <tr>\n")
        file.write("            <th> IP BLOCK NAME</th>\n")
        file.write(f"            <td> {block_name.upper()}</td>\n")
        file.write("        </tr>\n")
        file.write("\n")
        file.write("        <tr>\n")
        file.write("            <th>Base Address</th>\n")
        file.write("            <td>\n")
        file.write(f"                <addr>{base_address}</addr>\n")
        file.write("            </td>\n")
        file.write("        </tr>\n")
        file.write("\n")
        file.write("        <tr>\n")
        file.write("            <th>Bus Interface</th>\n")
        file.write("            <td>APB-Lite</td>\n")
        file.write("        </tr>\n")
        file.write("\n")
        file.write("    </table>\n")
        file.write("\n")
        file.write("\n")
        file.write("    <!-- =========================\n")
        file.write("         REGISTER MAP\n")
        file.write("    ========================== -->\n")
        file.write("\n")
        file.write("    <h2>Register Map Summary</h2>\n")
        file.write("\n")
        file.write("\n")
        file.write("    <table>\n")
        file.write("\n")
        file.write("        <tr>\n")
        file.write("            <th style=\"width:7%;\">OFFSET</th>\n")
        file.write("            <th style=\"width:16%;\">REGISTER NAME</th>\n")
        file.write("            <th style=\"width:8%;\">ACCESS TYPE</th>\n")
        file.write("            <th style=\"width:9%;\">RESET VALUE</th>\n")
        file.write("            <th style=\"width:60%;\">FUNCTIONAL DESCRIPTION</th>\n")
        file.write("        </tr>\n")
        file.write("\n")
        file.write("\n")
        for reg in regs:
            reg_name = reg.get('reg_name')
            offset_addr = reg.get('offset_addr')
            reg_description = reg.get('reg_description')

            reg_access_type = set()
            for field in reg.findall('Field'):
                reg_access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                reg_access_type.add(field.get('vector_field_access_type') or "")

            if reg_access_type and reg_access_type == {'ro'}:
                reg_access_disp = "RO"
            elif reg_access_type and reg_access_type == {'wo'}:
                reg_access_disp = "WO"
            else:
                reg_access_disp = "RW"

            reg_rst_val = 0

            for field in reg.findall('Field'):
                bit_pos = int(field.get('field_position'))
                bit_reset_raw = field.get('field_reset_value')
                bit_reset = int(bit_reset_raw, 0) if bit_reset_raw else 0
                reg_rst_val |= (bit_reset << bit_pos)

            for field in reg.findall('Vector_Field'):
                lsb = int(field.get('vector_field_position_lsb'))

                vec_reset_raw = field.get('vector_field_reset')
                if vec_reset_raw is not None:
                    vec_reset = int(vec_reset_raw, 2)
                else:
                    vec_reset_raw = field.get('vector_field_reset_value')
                    if vec_reset_raw is None:
                        vec_reset = 0
                    elif "'" in vec_reset_raw:
                        radix_char = vec_reset_raw.split("'")[1][0].lower()
                        digits = vec_reset_raw.split("'")[1][1:]
                        base = {'h': 16, 'b': 2, 'd': 10, 'o': 8}.get(radix_char, 16)
                        vec_reset = int(digits, base)
                    else:
                        vec_reset = int(vec_reset_raw, 0)

                reg_rst_val |= (vec_reset << lsb)

            hex_digits = register_width_int // 4
            reg_rst_hex_raw = format(reg_rst_val, f'0{hex_digits}x')
            grouped_chars = []
            for i, ch in enumerate(reversed(reg_rst_hex_raw)):
                if i and i % 4 == 0:
                    grouped_chars.append('_')
                grouped_chars.append(ch)
            reg_rst_hex = "'h" + "".join(reversed(grouped_chars))

            file.write("        <tr>\n")
            file.write("\n")
            file.write(f"            <td><addr>{offset_addr}</addr></td>\n")
            file.write(f"            <td><a href=\"#{reg_name}\">{reg_name}</a></td>\n")
            file.write(f"            <td>{reg_access_disp}</td>\n")
            file.write(f"            <td><addr>{reg_rst_hex}</addr></td>\n")
            reg_desc_lines = [line.strip() for line in re.split(r'\\n|\n', reg_description or "")]
            reg_desc_disp = "<br>".join(reg_desc_lines)
            file.write(f"            <td>{reg_desc_disp}</td>\n")
            file.write("        </tr>\n")
            file.write("\n")
            file.write("\n")

        file.write("    </table>")
        file.write("\n")
        file.write("\n")
        file.write("    <h2>Detailed Register Descriptions</h2>\n")
        file.write("\n")
        file.write("\n")


        for reg in regs:
            reg_name = reg.get('reg_name')
            offset_addr = reg.get('offset_addr')

            # ---- build a bit_map[position] -> field-info dict from the XML,
            #      RESERVED gets filled in for any bit no Field/Vector_Field covers ----
            bit_map = [None] * register_width_int

            for field in reg.findall('Field'):
                f_name = field.get('field_name')
                if not f_name or not f_name.strip():
                    continue
                f_pos = int(field.get('field_position'))
                f_access = (field.get('field_access_type') or "").upper()
                f_reset_raw = field.get('field_reset_value')
                f_reset = int(f_reset_raw, 0) if f_reset_raw else 0
                f_desc = field.get('field_description') or ""
                bit_map[f_pos] = {
                    'name': f_name, 'access': f_access, 'reset': f_reset,
                    'msb': f_pos, 'lsb': f_pos, 'desc': f_desc
                }

            for field in reg.findall('Vector_Field'):
                v_name = field.get('vector_field_name')
                if not v_name or not v_name.strip():
                    continue
                v_msb = int(field.get('vector_field_position_msb'))
                v_lsb = int(field.get('vector_field_position_lsb'))
                v_access = (field.get('vector_field_access_type') or "").upper()

                v_reset_raw = field.get('vector_field_reset')
                if v_reset_raw is not None:
                    v_reset = int(v_reset_raw, 2)
                else:
                    v_reset_raw = field.get('vector_field_reset_value')
                    if v_reset_raw is None:
                        v_reset = 0
                    elif "'" in v_reset_raw:
                        radix_char = v_reset_raw.split("'")[1][0].lower()
                        digits = v_reset_raw.split("'")[1][1:]
                        base = {'h': 16, 'b': 2, 'd': 10, 'o': 8}.get(radix_char, 16)
                        v_reset = int(digits, base)
                    else:
                        v_reset = int(v_reset_raw, 0)

                v_desc = field.get('vector_field_description') or ""
                v_info = {
                    'name': v_name, 'access': v_access, 'reset': v_reset,
                    'msb': v_msb, 'lsb': v_lsb, 'desc': v_desc
                }
                for pos in range(v_lsb, v_msb + 1):
                    bit_map[pos] = v_info

            # ---- collapse bit_map into MSB->LSB spans (RESERVED runs merged together) ----
            spans = []
            pos = register_width_int - 1
            while pos >= 0:
                info = bit_map[pos]
                if info is None:
                    span_msb = pos
                    while pos >= 0 and bit_map[pos] is None:
                        pos -= 1
                    span_lsb = pos + 1
                    spans.append({
                        'name': 'RESERVED', 'access': 'RO', 'reset': 0,
                        'msb': span_msb, 'lsb': span_lsb,
                        'desc': 'Reserved for future expansion. Reads return 0. Writes have no effect.'
                    })
                else:
                    spans.append(info)
                    pos = info['lsb'] - 1

            file.write("\n")
            file.write(f"    <div class = \"register-header\" id=\"{reg_name}\">\n")
            file.write(f"        <span class=\"register-name\"> {reg_name} </span>\n")
            file.write(f"        <span class=\"register-offset\">Offset Address : {offset_addr}</span>\n")
            file.write("    </div>\n")
            file.write("\n")

            # ---- bit-level diagram: bit numbers / field spans (colspan) / access type ----
            file.write("    <table class=\"bit-table\">\n")
            file.write("        <tr>\n")
            for bit in range(register_width_int - 1, -1, -1):
                file.write(f"            <td>{bit:02d}</td>\n")
            file.write("        </tr>\n")
            file.write("\n")
            file.write("        <tr>\n")
            for span in spans:
                width = span['msb'] - span['lsb'] + 1
                file.write(f"            <th colspan=\"{width}\">{span['name']}</th>\n")
            file.write("        </tr>\n")
            file.write("\n")
            file.write("        <tr>\n")
            for span in spans:
                width = span['msb'] - span['lsb'] + 1
                file.write(f"            <td colspan=\"{width}\">{span['access']}</td>\n")
            file.write("        </tr>\n")
            file.write("    </table>\n")
            file.write("\n")

            # ---- per-field description table ----
            file.write("    <table>\n")
            file.write("        <tr>\n")
            file.write("            <th style=\"width:8%;\">BITS</th>\n")
            file.write("            <th style=\"width:14%;\">FIELD NAME</th>\n")
            file.write("            <th style=\"width:10%;\">ACCESS TYPE</th>\n")
            file.write("            <th style=\"width:12%;\">RESET VALUE</th>\n")
            file.write("            <th style=\"width:56%;\">FUNCTIONAL DESCRIPTION</th>\n")
            file.write("        </tr>\n")
            file.write("\n")

            for span in spans:
                width = span['msb'] - span['lsb'] + 1
                bits_disp = str(span['msb']) if width == 1 else f"{span['msb']}:{span['lsb']}"
                rst_digits = max(1, (width + 3) // 4)
                rst_hex_raw = format(span['reset'], f'0{rst_digits}x')
                grouped_chars = []
                for i, ch in enumerate(reversed(rst_hex_raw)):
                    if i and i % 4 == 0:
                        grouped_chars.append('_')
                    grouped_chars.append(ch)
                rst_disp = "'h" + "".join(reversed(grouped_chars))
                row_style = " style=\"color:#9ca3af;\"" if span['name'] == 'RESERVED' else ""
                file.write(f"        <tr{row_style}>\n")
                file.write(f"            <td>{bits_disp}</td>\n")
                file.write(f"            <td>{span['name']}</td>\n")
                file.write(f"            <td>{span['access']}</td>\n")
                file.write(f"            <td>{rst_disp}</td>\n")
                desc_lines = [line.strip() for line in re.split(r'\\n|\n', span['desc'] or "")]
                desc_disp = "<br>".join(desc_lines)
                file.write(f"            <td>{desc_disp}</td>\n")
                file.write("        </tr>\n")
                file.write("\n")

            file.write("    </table>\n")

        file.write("\n")
        file.write("</body>\n")
        file.write("</html>\n")



# -------------------- RTL Files --------------------
def rtl(xml_file):    
    define(xml_file)
    csr(xml_file)


#------------------------------ DEFINES -------------------------
def define(xml_file):
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    if not block_name:
        raise ValueError("block_name is empty in the XML -- fill in ")

    data_width     = root.find('data_width').get('data_width')
    address_width  = root.find('address_width').get('addr_width')
    register_width = root.find('register_width').get('reg_width')
    base_address   = root.find('base_address').get('base_addr')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width', 'base_address']:
            continue
        regs.append(reg)

    os.makedirs("rtl", exist_ok=True)
    
    with open(f"rtl/{block_name.lower()}_define.v", "w", encoding="utf-8") as file: 
        file.write("//-------------------------------------------------------------------------\n")
        file.write(f"//// {block_name.upper()} Register Map - Auto-generated Verilog Defines    \n")
        file.write("//-------------------------------------------------------------------------\n")
        file.write("\n")
        file.write(f"`define {block_name.upper()}_DATA_WIDTH {data_width}\n")
        file.write(f"`define {block_name.upper()}_ADDR_WIDTH {address_width}\n")
        file.write(f"`define {block_name.upper()}_REG_WIDTH  {register_width}\n")
        file.write(f"`define {block_name.upper()}_BASE_ADDR  {base_address}\n")
        file.write("\n")
        
        # -------------------------- ADDRESS ---------------------
        file.write("// --------------------------\n")
        file.write("// Register Addresses\n")
        file.write("// --------------------------\n")
        file.write("\n")

        for reg in regs:
            reg_addr = reg.get('offset_addr')
            reg_name = reg.get('reg_name')
            file.write(f"`define {block_name.upper()}_{reg_name.upper()}_ADDR {reg_addr}\n")
        
        file.write("\n")
        
        # -------------------------- RESET ----------------------
        file.write("// --------------------------\n")
        file.write("// Register Reset Values\n")
        file.write("// --------------------------\n")
        file.write("\n")

        for reg in regs:
            reg_name = reg.get('reg_name')

            reg_rst_val = 0

            for field in reg.findall('Field'):
                bit_pos = int(field.get('field_position'))
                bit_reset_raw = field.get('field_reset_value')
                bit_reset = int(bit_reset_raw, 0) if bit_reset_raw else 0
                reg_rst_val |= (bit_reset << bit_pos)

            for field in reg.findall('Vector_Field'):
                lsb = int(field.get('vector_field_position_lsb'))

                vec_reset_raw = field.get('vector_field_reset')
                if vec_reset_raw is not None:
                    vec_reset = int(vec_reset_raw, 2)
                else:
                    vec_reset_raw = field.get('vector_field_reset_value')
                    if vec_reset_raw is None:
                        vec_reset = 0
                    elif "'" in vec_reset_raw:
                        radix_char = vec_reset_raw.split("'")[1][0].lower()
                        digits = vec_reset_raw.split("'")[1][1:]
                        base = {'h': 16, 'b': 2, 'd': 10, 'o': 8}.get(radix_char, 16)
                        vec_reset = int(digits, base)
                    else:
                        vec_reset = int(vec_reset_raw, 0)

                reg_rst_val |= (vec_reset << lsb)

            reg_rst = f"{register_width}'h{reg_rst_val:x}"
            file.write(f"`define {block_name.upper()}_{reg_name.upper()}_RST {reg_rst}\n")

        file.write("\n")

        # -------------------------- MASK -----------------------
        file.write("// --------------------------\n")
        file.write("// Register Mask Values\n")
        file.write("// --------------------------\n")
        file.write("\n")

        for reg in regs:
            reg_name = reg.get('reg_name')

            reg_mask_val = 0

            for field in reg.findall('Field'):
                bit_name = field.get('field_name')
                if not bit_name or not bit_name.strip():
                    continue  
                bit_pos = int(field.get('field_position'))
                reg_mask_val |= (1 << bit_pos)

            for field in reg.findall('Vector_Field'):
                bit_name = field.get('vector_field_name')
                if not bit_name or not bit_name.strip():
                    continue  
                msb = int(field.get('vector_field_position_msb'))
                lsb = int(field.get('vector_field_position_lsb'))
                width = msb - lsb + 1
                reg_mask_val |= (((1 << width) - 1) << lsb)

            reg_mask = f"{register_width}'h{reg_mask_val:x}"
            file.write(f"`define {block_name.upper()}_{reg_name.upper()}_MASK {reg_mask}\n")

        file.write("\n")

        # --------------------------- VECTOR WIDTHS ---------------
        file.write("// --------------------------\n")
        file.write("// Vector Output Widths\n")
        file.write("// --------------------------\n")
        file.write("\n")
        
        for reg in regs:
            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                direction = "I"
            else:
                direction = "O"

            for field in reg.findall('Vector_Field'):
                vec_name = field.get('vector_field_name')
                msb = int(field.get('vector_field_position_msb'))
                lsb = int(field.get('vector_field_position_lsb'))
                width = msb - lsb + 1
                file.write(f"`define {block_name.upper()}_{vec_name.upper()}_{direction}_WIDTH {width}\n")
       
        file.write("\n")
        
        # --------------------------- BIT POSITION ---------------
        file.write("// --------------------------\n")
        file.write("// Register Bit Positions\n")
        file.write("// --------------------------\n")
        file.write("\n")
 
        for reg in regs:
            reg_name = reg.get('reg_name')
            file.write(f"//---------------- {reg_name.upper()} -----------\n")

            for field in reg.findall('Field'):
                bit_name = field.get('field_name')
                if not bit_name or not bit_name.strip():
                    continue 

                bit_pos = field.get('field_position')
                file.write(f"`define {block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS {bit_pos}\n")

                bit_mask = 1 << int(bit_pos)

            for field in reg.findall('Vector_Field'):
                bit_name = field.get('vector_field_name')
                if not bit_name or not bit_name.strip():
                    continue  

                msb = int(field.get('vector_field_position_msb'))
                lsb = int(field.get('vector_field_position_lsb'))
                width = msb - lsb + 1
                idx_digits = len(str(width - 1))

                for pos in range(msb, lsb - 1, -1):
                    idx = pos - lsb
                    file.write(f"`define {block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}{idx:0{idx_digits}d}_POS {pos}\n")

                vec_mask = ((1 << width) - 1) << lsb            
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
    base_address   = root.find('base_address').get('base_addr')

    regs = []
    for reg in root:
        if reg.tag in ['block_name', 'data_width', 'address_width', 'register_width', 'base_address']:
            continue
        regs.append(reg)

    vector_groups_by_reg = {}
    individual_fields_by_reg = {}
    
    for reg in regs:
        reg_name = reg.get('reg_name')


        vector_fields = {}
        for vf in reg.findall('Vector_Field'):
            vf_name = vf.get('vector_field_name')
            msb = int(vf.get('vector_field_position_msb'))
            lsb = int(vf.get('vector_field_position_lsb'))
            vector_fields[vf_name] = msb - lsb + 1

        individual = []
        for f in reg.findall('Field'):
            individual.append((f.get('field_name'), f.get('field_position')))

        vector_groups_by_reg[reg_name] = vector_fields
        individual_fields_by_reg[reg_name] = individual

    with open(f"rtl/{block_name.lower()}_csr.v", "w", encoding="utf-8") as file:
        file.write(f"`include \"{block_name.lower()}_define.v\"\n")
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
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                reg_wr = "ro"
            else:
                reg_wr = "wr"
            
            if reg_wr == "wr":
                for name, width in vector_groups_by_reg[reg_name].items():
                    field_ports.append(("output", f"[`{block_name.upper()}_{name.upper()}_O_WIDTH-1:0]", f"{name.lower()}_o", ","))
                for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                    field_ports.append(("output", "", f"{bit_name.lower()}_o", ","))
            else:
                for name, width in vector_groups_by_reg[reg_name].items():
                    field_ports.append(("input", f"[`{block_name.upper()}_{name.upper()}_I_WIDTH-1:0]", f"{name.lower()}_i", ","))
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
            reg_name = reg.get('reg_name')
            file.write(f"reg  [`{block_name.upper()}_REG_WIDTH-1:0] {reg_name.lower()}_reg;\n")

        file.write("\n")
        file.write("assign wr_enb = psel_i && penable_i && pwrite_i;\n")
        file.write("assign rd_enb = psel_i && penable_i && !pwrite_i;\n")
        file.write("\n")
        
        file.write("assign addr_valid = (")   
        for i, reg in enumerate(regs):
            reg_name = reg.get('reg_name')
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
        file.write("// Register writes \n")
        file.write("//----------------------------------------------------------------------\n")
        file.write("always @(posedge pclk or negedge preset_n)\n")
        file.write("begin\n")
        file.write("   if (preset_n == 1'b0)\n")
        file.write("   begin\n")
        
        for reg in regs:
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                reg_wr = "ro"
            else:
                reg_wr = "wr"

            if reg_wr != "wr":
                continue
            file.write(f"      {reg_name.lower()}_reg <= `{block_name.upper()}_{reg_name.upper()}_RST;\n")
        
        file.write("   end\n")
        file.write("   \n")
        file.write("   else\n")
        file.write("   begin\n")
        
        first_wr = True
        for reg in regs:
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                reg_wr = "ro"
            else:
                reg_wr = "wr"

            if reg_wr != "wr":
                continue
            if first_wr:
                file.write(f"      if (wr_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
                first_wr = False
            else:
                file.write(f"      else if (wr_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
            file.write("      begin\n")
            file.write(f"         {reg_name.lower()}_reg <= pwdata_i & `{block_name.upper()}_{reg_name.upper()}_MASK;\n".format(reg_name=reg_name))
            file.write("      end\n\n")
        
        file.write("   end\n")
        file.write("end\n")
        file.write("\n")
        
        file.write("//----------------------------------------------------------------------\n")
        file.write("// Read-only register  \n")
        file.write("//----------------------------------------------------------------------\n")
        for reg in regs:
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                reg_wr = "ro"

            elif access_type and access_type == {'wo'}:
                reg_wr = "wo" 

            else:
                reg_wr = "wr"

            if reg_wr == "wr" or reg_wr == "wo":
                continue
            file.write("always @(*)\n")
            file.write("begin\n")
            file.write(f"   {reg_name.lower()}_reg = {{`{block_name.upper()}_REG_WIDTH{{1'b0}}}};\n")
            for field in reg.findall('Field'):
                bit_name = field.get('field_name')
                file.write(f"   {reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS] = {bit_name.lower()}_i;\n")
            for field in reg.findall('Vector_Field'):
                bit_name = field.get('vector_field_name')
                msb = int(field.get('vector_field_position_msb'))
                lsb = int(field.get('vector_field_position_lsb'))
                width = msb - lsb + 1
                idx_digits = len(str(width - 1))
                for idx in range(width - 1, -1, -1):
                    file.write(f"   {reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}{idx:0{idx_digits}d}_POS] = {bit_name.lower()}_i[{idx}];\n")
            file.write("end\n")
            file.write("\n")

        file.write("//----------------------------------------------------------------------\n")
        file.write("// Register reads \n")
        file.write("//----------------------------------------------------------------------\n")
        file.write("always @(*)\n")
        file.write("begin\n")
        
        first_rd = True
        for reg in regs:
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'wo'}:
                continue  # write-only register -- not readable, falls through to the 0 default

            if first_rd:
                file.write(f"   if (rd_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
                first_rd = False
            else:
                file.write(f"   else if (rd_enb && (paddr_i == `{block_name.upper()}_{reg_name.upper()}_ADDR))\n")
            file.write("   begin\n")
            file.write(f"      prdata_o = {reg_name.lower()}_reg & `{block_name.upper()}_{reg_name.upper()}_MASK;\n")
            file.write("   end\n\n")
        
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
            reg_name = reg.get('reg_name')

            access_type = set()
            for field in reg.findall('Field'):
                access_type.add(field.get('field_access_type') or "")
            for field in reg.findall('Vector_Field'):
                access_type.add(field.get('vector_field_access_type') or "")

            if access_type and access_type == {'ro'}:
                reg_wr = "ro"

            else:
                reg_wr = "wr"

            if reg_wr != "wr" :
                continue
            
            for name, width in vector_groups_by_reg[reg_name].items():
                # `_POS` macros for a vector are decomposed per-bit (e.g. `SAMPLE2_POS`,
                # `SAMPLE1_POS`, `SAMPLE0_POS`), so rebuild the bus with a concatenation,
                # MSB (highest index) first -- same zero-padding as the defines() side.
                idx_digits = len(str(width - 1))
                concat_parts = []
                for idx in range(width - 1, -1, -1):
                    concat_parts.append(f"{reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{name.upper()}{idx:0{idx_digits}d}_POS]")
                concat_str = ", ".join(concat_parts)
                file.write(f"assign {name.lower()}_o = {{{concat_str}}};\n")
            
            for bit_name, bit_pos in individual_fields_by_reg[reg_name]:
                file.write(f"assign {bit_name.lower()}_o = {reg_name.lower()}_reg[`{block_name.upper()}_{reg_name.upper()}_{bit_name.upper()}_POS];\n")
       
        
        file.write("\n")
        file.write("endmodule\n")




#---------------------------- main -----------------------------------------------
def main():
    print("******************************************")
    print("Configuration Status Register (APB)")
    print("******************************************")
    print("------------------------------------------")
    xml_file = input("Enter XML file path: ").strip()
    print("------------------------------------------")
    rtl(xml_file)
    doc(xml_file)
    tree = ET.parse(xml_file)
    root = tree.getroot()
    block_elem = root.find('block_name')
    block_name = (block_elem.get('block_name') or "").strip().lower() if block_elem is not None else ""
    print(f"RTL generated in rtl/ folder:")
    print(f"  - rtl/{block_name.lower()}_define.v")
    print(f"  - rtl/{block_name.lower()}_csr.v")
    print("------------------------------------------")
    print(f"Document file:")
    print(f"  - {block_name.lower()}_doc.html")
    print("------------------------------------------")
    print("******************************************")


if __name__ == "__main__":
    main()
