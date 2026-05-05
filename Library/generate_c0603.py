#!/usr/bin/env python3
"""Generate The_C0603_Library.kicad_sym mirroring the structure of
The_R0603_Library.kicad_sym, populated with Murata GCM 0603 capacitor
families derived from Murata's MLCC part-numbering scheme.
"""

from pathlib import Path

OUT = Path(__file__).parent / "Symbols" / "The_C0603_Library.kicad_sym"


# ---------- Murata cap-code helpers ----------

def cap_code(pf: float) -> str:
    """Return Murata 3-char capacitance code for value in pF.

    <10pF uses 'R' as decimal point (1R0=1.0pF, 4R7=4.7pF).
    >=10pF uses 2 sig figs + decade exponent (101=100pF, 224=220nF).
    """
    if pf < 10:
        # 1 digit . 1 digit format: 'XRY' where X.Y = value
        whole = int(pf)
        frac = int(round((pf - whole) * 10))
        if frac == 0:
            return f"{whole}R0"
        return f"{whole}R{frac}"
    # >= 10 pF : two significant figures + power-of-ten exponent
    e = 0
    v = pf
    while v >= 100:
        v /= 10.0
        e += 1
    sig = int(round(v))
    return f"{sig:02d}{e}"


def fmt_value(pf: float) -> str:
    """Human-readable cap value, e.g. '4.7pF', '10nF', '1uF'."""
    if pf < 1000:
        v = pf
        unit = "pF"
    elif pf < 1_000_000:
        v = pf / 1000.0
        unit = "nF"
    else:
        v = pf / 1_000_000.0
        unit = "uF"
    if abs(v - round(v)) < 1e-9:
        return f"{int(round(v))}{unit}"
    # 1 decimal place
    s = f"{v:.1f}"
    return f"{s}{unit}"


def fmt_value_desc(pf: float) -> str:
    """Description-style value, e.g. '4.7 pF', '10 nF', '1 uF'."""
    if pf < 1000:
        v, u = pf, "pF"
    elif pf < 1_000_000:
        v, u = pf / 1000.0, "nF"
    else:
        v, u = pf / 1_000_000.0, "uF"
    if abs(v - round(v)) < 1e-9:
        return f"{int(round(v))} {u}"
    return f"{v:.1f} {u}"


# ---------- Series definitions ----------
# Each spec generates a derived symbol per cap value.

# tolerance picker
def tol_c0g(pf: float) -> str:
    # tolerance code letter for C0G dielectric
    if pf <= 1.5:
        # tighter for very low values; preserve existing 1.5pF=B,1pF=C convention
        return "B" if pf == 1.5 or pf < 1.0 else "C"
    if pf < 10:
        return "C"   # +/-0.25 pF
    return "J"       # +/-5%


def tol_text_c0g(pf: float) -> str:
    code = tol_c0g(pf)
    return {"B": "±0.1pF", "C": "±0.25pF", "F": "±1%",
            "G": "±2%", "J": "±5%"}[code]


# Existing/known overrides — preserve these exact part numbers so
# any boards already referencing them still resolve cleanly.
GCM_C0G_100V_OVERRIDES = {
    1.0: ("GCM1885C2A1R0CA16D",  "490-GCM1885C2A1R0CA16DTR-ND"),
    1.5: ("GCM1885C2A1R5BA16D",  "490-GCM1885C2A1R5BA16DTR-ND"),
    3.3: ("GCM1885C2A3R3CA16D",  "490-GCM1885C2A3R3CA16DTR-ND"),
    15:  ("GCM1885C2A150FA16D",  "490-16416-2-ND"),
    22:  ("GCM1885C2A220JA16D",  "490-4942-2-ND"),
    47:  ("GCM1885C2A470JA16J",  "490-GCM1885C2A470JA16JTR-ND"),
    100: ("GCM1885C2A101JA16D",  "490-4771-2-ND"),
    220: ("GCM1885C2A221JA16D",  "490-4947-2-ND"),
}

# C0G 100V values in pF available in Murata 0603 GCM1885C2A
C0G_100V_VALUES_PF = [
    0.5, 1.0, 1.5, 2.2, 3.3, 4.7, 6.8,
    10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82,
    100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820,
    1000, 1500, 2200, 3300, 4700,
]

# X7R 100V (GCM188R72A...KA37D) — preserve existing 10nF entry
X7R_100V_OVERRIDES = {
    10000: ("GCM188R72A103KA37D", "490-4781-2-ND"),
}
X7R_100V_VALUES_PF = [
    100, 150, 220, 330, 470, 680,
    1000, 1500, 2200, 3300, 4700, 6800,
    10000, 15000, 22000,
]

# Soft-termination X7R 100V (GCJ188R72A...KA01D) — single existing entry
GCJ_X7R_100V_OVERRIDES = {
    100000: ("GCJ188R72A104KA01D", "490-13420-2-ND"),
}

# X7R 25V (GCJ188R71E...KA01D)
GCJ_X7R_25V_OVERRIDES = {
    1_000_000: ("GCJ188R71E105KA01D", "490-14409-2-ND"),
}

# X5R 10V (GRM188R61A...ME69D)
GRM_X5R_10V_OVERRIDES = {
    10_000_000: ("GRM188R61A106ME69D", "490-10475-2-ND"),
}

# C0G 50V (GRM1885C1H...JA01D)
GRM_C0G_50V_OVERRIDES = {
    1000: ("GRM1885C1H102JA01D", "490-1451-2-ND"),
}


def gcm_c0g_100v_pn(pf: float):
    if pf in GCM_C0G_100V_OVERRIDES:
        return GCM_C0G_100V_OVERRIDES[pf]
    cc = cap_code(pf)
    tc = tol_c0g(pf)
    pn = f"GCM1885C2A{cc}{tc}A16D"
    spn = f"490-{pn}TR-ND"
    return pn, spn


def gcm_x7r_100v_pn(pf: float):
    if pf in X7R_100V_OVERRIDES:
        return X7R_100V_OVERRIDES[pf]
    cc = cap_code(pf)
    pn = f"GCM188R72A{cc}KA37D"
    spn = f"490-{pn}TR-ND"
    return pn, spn


# ---------- File templating ----------

# header through end of C_Small + C0603 base symbol
HEADER = r'''(kicad_symbol_lib
	(version 20251024)
	(generator "kicad_symbol_editor")
	(generator_version "10.0")
	(symbol "C_Small"
		(pin_numbers
			(hide yes)
		)
		(pin_names
			(offset 0.254)
			(hide yes)
		)
		(exclude_from_sim no)
		(in_bom yes)
		(on_board yes)
		(in_pos_files yes)
		(duplicate_pin_numbers_are_jumpers no)
		(property "Reference" "C"
			(at 0.254 2.794 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "C"
			(at 0.254 -2.794 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" ""
			(at 1.27 -15.24 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Datasheet" ""
			(at 14.478 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Description" ""
			(at 1.27 -12.7 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Sim.Device" "C"
			(at 14.478 2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Type" "="
			(at 14.732 1.016 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Params" "c=C_Small"
			(at 19.05 4.572 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Pins" "1=+ 2=-"
			(at 18.796 6.35 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Manufacturer" ""
			(at 1.27 -5.08 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Manufacturer Part Number" ""
			(at 1.27 -2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier" ""
			(at 1.27 -10.16 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier Part Number" ""
			(at 1.27 -7.62 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "ki_keywords" "C capacitor"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "ki_fp_filters" "C_*"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(symbol "C_Small_0_1"
			(polyline
				(pts
					(xy -1.524 0.508) (xy 1.524 0.508)
				)
				(stroke
					(width 0.3048)
					(type default)
				)
				(fill
					(type none)
				)
			)
			(polyline
				(pts
					(xy -1.524 -0.508) (xy 1.524 -0.508)
				)
				(stroke
					(width 0.3302)
					(type default)
				)
				(fill
					(type none)
				)
			)
		)
		(symbol "C_Small_1_1"
			(pin passive line
				(at 0 2.54 270)
				(length 2.032)
				(name ""
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(number "1"
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
			)
			(pin passive line
				(at 0 -2.54 90)
				(length 2.032)
				(name ""
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
				(number "2"
					(effects
						(font
							(size 1.27 1.27)
						)
					)
				)
			)
		)
		(embedded_fonts no)
	)
	(symbol "C0603"
		(extends "C_Small")
		(property "Reference" "C"
			(at 0.254 2.794 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "C"
			(at 0.254 -2.794 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "The_Parts_Library:C_0603"
			(at 1.27 -15.24 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Datasheet" ""
			(at 14.478 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Description" ""
			(at 1.27 -12.7 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier" "Digikey"
			(at 1.27 -10.16 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier Part Number" ""
			(at 1.27 -7.62 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Manufacturer" "Murata Electronics"
			(at 1.27 -5.08 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Manufacturer Part Number" ""
			(at 1.27 -2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Sim.Device" "C"
			(at 14.478 2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Type" "="
			(at 14.732 1.016 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Params" "c=C_Small"
			(at 19.05 4.572 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Pins" "1=+ 2=-"
			(at 18.796 6.35 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "ki_keywords" "C capacitor C0603"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "ki_fp_filters" "C_*"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(embedded_fonts no)
	)
'''


def derived(symbol_name, value, description, datasheet, mpn, spn):
    """Render a single derived C0603_* symbol block (175-line analog)."""
    return f'''	(symbol "{symbol_name}"
		(extends "C0603")
		(property "Reference" "C"
			(at 0.762 0.508 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Value" "{value}"
			(at 0.762 -1.016 0)
			(show_name no)
			(do_not_autoplace no)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Footprint" "The_Parts_Library:C_0603"
			(at 0.762 -14.478 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Datasheet" "{datasheet}"
			(at 2.54 -9.398 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Description" "{description}"
			(at 1.016 -12.192 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier" "Digikey"
			(at 1.016 -8.636 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Supplier Part Number" "{spn}"
			(at 1.016 -10.414 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Manufacturer" "Murata Electronics"
			(at 1.016 -4.826 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Manufacturer Part Number" "{mpn}"
			(at 1.27 -2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
				(justify left)
			)
		)
		(property "Sim.Device" "C"
			(at 14.478 2.54 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Type" "="
			(at 14.732 1.016 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Params" "c=C_Small"
			(at 19.05 4.572 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "Sim.Pins" "1=+ 2=-"
			(at 18.796 6.35 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "ki_keywords" "C capacitor C0603"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(property "ki_fp_filters" "C_*"
			(at 0 0 0)
			(show_name no)
			(do_not_autoplace no)
			(hide yes)
			(effects
				(font
					(size 1.27 1.27)
				)
			)
		)
		(embedded_fonts no)
	)
'''


# ---------- Build all entries ----------

GCM_DATASHEET = "https://search.murata.co.jp/Ceramy/CatalogshowpageAction.do?sHinnm=GCM1885C2A100JA16"
GCM_X7R_DATASHEET = "https://search.murata.co.jp/Ceramy/CatalogshowpageAction.do?sHinnm=GCM188R72A104KA37"
GCJ_DATASHEET = "https://search.murata.co.jp/Ceramy/CatalogshowpageAction.do?sHinnm=GCJ188R72A104KA01"
GRM_X5R_DATASHEET = "https://search.murata.co.jp/Ceramy/CatalogshowpageAction.do?sHinnm=GRM188R61A106ME69"
GRM_C0G_DATASHEET = "https://search.murata.co.jp/Ceramy/CatalogshowpageAction.do?sHinnm=GRM1885C1H102JA01"


def gather_entries():
    """Build a name-keyed dict of all derived symbol entries."""
    entries = {}

    # GCM C0G 100V family
    for pf in C0G_100V_VALUES_PF:
        v = fmt_value(pf)
        name = f"C0603_{v}_100V_C0G"
        mpn, spn = gcm_c0g_100v_pn(pf)
        desc = (f"{fmt_value_desc(pf)} {tol_text_c0g(pf)} 100V "
                f"Ceramic Capacitor C0G, NP0 0603 (1608 Metric)")
        entries[name] = (v, desc, GCM_DATASHEET, mpn, spn)

    # GCM X7R 100V family
    for pf in X7R_100V_VALUES_PF:
        v = fmt_value(pf)
        name = f"C0603_{v}_100V_X7R"
        mpn, spn = gcm_x7r_100v_pn(pf)
        desc = (f"{fmt_value_desc(pf)} ±10% 100V "
                f"Ceramic Capacitor X7R 0603 (1608 Metric)")
        entries[name] = (v, desc, GCM_X7R_DATASHEET, mpn, spn)

    # Soft-term X7R 100V (single existing entry)
    for pf, (mpn, spn) in GCJ_X7R_100V_OVERRIDES.items():
        v = fmt_value(pf)
        name = f"C0603_{v}_100V_X7R"
        # overwrites GCM family entry at same value if any (none at 100nF in GCM list)
        desc = (f"{fmt_value_desc(pf)} ±10% 100V "
                f"Ceramic Capacitor X7R 0603 (1608 Metric)")
        entries[name] = (v, desc, GCJ_DATASHEET, mpn, spn)

    # X7R 25V (1 uF)
    for pf, (mpn, spn) in GCJ_X7R_25V_OVERRIDES.items():
        v = fmt_value(pf)
        name = f"C0603_{v}_25V_X7R"
        desc = (f"{fmt_value_desc(pf)} ±10% 25V "
                f"Ceramic Capacitor X7R 0603 (1608 Metric)")
        entries[name] = (v, desc, GCJ_DATASHEET, mpn, spn)

    # X5R 10V (10 uF)
    for pf, (mpn, spn) in GRM_X5R_10V_OVERRIDES.items():
        v = fmt_value(pf)
        name = f"C0603_{v}_10V_X5R"
        desc = (f"{fmt_value_desc(pf)} ±20% 10V "
                f"Ceramic Capacitor X5R 0603 (1608 Metric)")
        entries[name] = (v, desc, GRM_X5R_DATASHEET, mpn, spn)

    # C0G 50V (1 nF)
    for pf, (mpn, spn) in GRM_C0G_50V_OVERRIDES.items():
        v = fmt_value(pf)
        name = f"C0603_{v}_50V_C0G"
        desc = (f"{fmt_value_desc(pf)} ±5% 50V "
                f"Ceramic Capacitor C0G, NP0 0603 (1608 Metric)")
        entries[name] = (v, desc, GRM_C0G_DATASHEET, mpn, spn)

    return entries


def main():
    entries = gather_entries()
    # Sort by name for stable output
    names = sorted(entries.keys())

    parts = [HEADER]
    for n in names:
        v, desc, ds, mpn, spn = entries[n]
        parts.append(derived(n, v, desc, ds, mpn, spn))
    parts.append(")\n")

    OUT.write_text("".join(parts))
    print(f"Wrote {OUT} with {len(names)} derived symbols.")


if __name__ == "__main__":
    main()
