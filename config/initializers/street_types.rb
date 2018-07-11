STREET_TYPES = ["ALLEY", "ALLEE", "ALY", "ALLY", "ANEX", "ANX", "ANNEX", "ANNX", "ARCADE", "ARC", "AVENUE", "AV", "AVE", "AVEN", "AVENU", "AVN", "AVNUE", "BAYOU", "BAYOO", "BYU", "BEACH", "BCH", "BEND", "BND", "BLUFF", "BLF", "BLUF", "BLUFFS", "BLFS", "BOTTOM", "BOT", "BTM", "BOTTM", "BOULEVARD", "BLVD", "BOUL", "BOULV", "BRANCH", "BR", "BRNCH", "BRIDGE", "BRDGE", "BRG", "BROOK", "BRK", "BROOKS", "BRKS", "BURG", "BG", "BURGS", "BGS", "BYPASS", "BYP", "BYPA", "BYPAS", "BYPS", "CAMP", "CP", "CMP", "CANYON", "CANYN", "CYN", "CNYN", "CAPE", "CPE", "CAUSEWAY", "CSWY", "CAUSWA", "CENTER", "CEN", "CTR", "CENT", "CENTR", "CENTRE", "CNTER", "CNTR", "CENTERS", "CTRS", "CIRCLE", "CIR", "CIRC", "CIRCL", "CRCL", "CRCLE", "CIRCLES", "CIRS", "CLIFF", "CLF", "CLIFFS", "CLFS", "CLUB", "CLB", "COMMON", "CMN", "COMMONS", "CMNS", "CORNER", "COR", "CORNERS", "CORS", "COURSE", "CRSE", "COURT", "CT", "COURTS", "CTS", "COVE", "CV", "COVES", "CVS", "CREEK", "CRK", "CRESCENT", "CRES", "CRSENT", "CRSNT", "CREST", "CRST", "CROSSING", "XING", "CRSSNG", "CROSSROAD", "XRD", "CROSSROADS", "XRDS", "CURVE", "CURV", "DALE", "DL", "DAM", "DM", "DIVIDE", "DIV", "DV", "DVD", "DRIVE", "DR", "DRIV", "DRV", "DRIVES", "DRS", "ESTATE", "EST", "ESTATES", "ESTS", "EXPRESSWAY", "EXP", "EXPY", "EXPR", "EXPRESS", "EXPW", "EXTENSION", "EXT", "EXTN", "EXTNSN", "EXTENSIONS", "EXTS", "FALL", "FALLS", "FLS", "FERRY", "FRY", "FRRY", "FIELD", "FLD", "FIELDS", "FLDS", "FLAT", "FLT", "FLATS", "FLTS", "FORD", "FRD", "FORDS", "FRDS", "FOREST", "FRST", "FORESTS", "FORGE", "FORG", "FRG", "FORGES", "FRGS", "FORK", "FRK", "FORKS", "FRKS", "FORT", "FT", "FRT", "FREEWAY", "FWY", "FREEWY", "FRWAY", "FRWY", "GARDEN", "GDN", "GARDN", "GRDEN", "GRDN", "GARDENS", "GDNS", "GRDNS", "GATEWAY", "GTWY", "GATEWY", "GATWAY", "GTWAY", "GLEN", "GLN", "GLENS", "GLNS", "GREEN", "GRN", "GREENS", "GRNS", "GROVE", "GROV", "GRV", "GROVES", "GRVS", "HARBOR", "HARB", "HBR", "HARBR", "HRBOR", "HARBORS", "HBRS", "HAVEN", "HVN", "HEIGHTS", "HT", "HTS", "HIGHWAY", "HWY", "HIGHWY", "HIWAY", "HIWY", "HWAY", "HILL", "HL", "HILLS", "HLS", "HOLLOW", "HLLW", "HOLW", "HOLLOWS", "HOLWS", "INLET", "INLT", "ISLAND", "IS", "ISLND", "ISLANDS", "ISS", "ISLNDS", "ISLE", "ISLES", "JUNCTION", "JCT", "JCTION", "JCTN", "JUNCTN", "JUNCTON", "JUNCTIONS", "JCTNS", "JCTS", "KEY", "KY", "KEYS", "KYS", "KNOLL", "KNL", "KNOL", "KNOLLS", "KNLS", "LAKE", "LK", "LAKES", "LKS", "LAND", "LANDING", "LNDG", "LNDNG", "LANE", "LN", "LIGHT", "LGT", "LIGHTS", "LGTS", "LOAF", "LF", "LOCK", "LCK", "LOCKS", "LCKS", "LODGE", "LDG", "LDGE", "LODG", "LOOP", "LOOPS", "MALL", "MANOR", "MNR", "MANORS", "MNRS", "MEADOW", "MDW", "MEADOWS", "MDWS", "MEDOWS", "MEWS", "MILL", "ML", "MILLS", "MLS", "MISSION", "MISSN", "MSN", "MSSN", "MOTORWAY", "MTWY", "MOUNT", "MNT", "MT", "MOUNTAIN", "MNTAIN", "MTN", "MNTN", "MOUNTIN", "MTIN", "MOUNTAINS", "MNTNS", "MTNS", "NECK", "NCK", "ORCHARD", "ORCH", "ORCHRD", "OVAL", "OVL", "OVERPASS", "OPAS", "PARK", "PRK", "PARKS", "PARKWAY", "PKWY", "PARKWY", "PKWAY", "PKY", "PARKWAYS", "PKWYS", "PASS", "PASSAGE", "PSGE", "PATH", "PATHS", "PIKE", "PIKES", "PINE", "PNE", "PINES", "PNES", "PLACE", "PL", "PLAIN", "PLN", "PLAINS", "PLNS", "PLAZA", "PLZ", "PLZA", "POINT", "PT", "POINTS", "PTS", "PORT", "PRT", "PORTS", "PRTS", "PRAIRIE", "PR", "PRR", "RADIAL", "RAD", "RADL", "RADIEL", "RAMP", "RANCH", "RNCH", "RANCHES", "RNCHS", "RAPID", "RPD", "RAPIDS", "RPDS", "REST", "RST", "RIDGE", "RDG", "RDGE", "RIDGES", "RDGS", "RIVER", "RIV", "RVR", "RIVR", "ROAD", "RD", "ROADS", "RDS", "ROUTE", "RTE", "ROW", "RUE", "RUN", "SHOAL", "SHL", "SHOALS", "SHLS", "SHORE", "SHOAR", "SHR", "SHORES", "SHOARS", "SHRS", "SKYWAY", "SKWY", "SPRING", "SPG", "SPNG", "SPRNG", "SPRINGS", "SPGS", "SPNGS", "SPRNGS", "SPUR", "SPURS", "SQUARE", "SQ", "SQR", "SQRE", "SQU", "SQUARES", "SQRS", "SQS", "STATION", "STA", "STATN", "STN", "STRAVENUE", "STRA", "STRAV", "STRAVEN", "STRAVN", "STRVN", "STRVNUE", "STREAM", "STRM", "STREME", "STREET", "ST", "STRT", "STR", "STREETS", "STS", "SUMMIT", "SMT", "SUMIT", "SUMITT", "TERRACE", "TER", "TERR", "THROUGHWAY", "TRWY", "TRACE", "TRCE", "TRACES", "TRACK", "TRAK", "TRACKS", "TRK", "TRKS", "TRAFFICWAY", "TRFY", "TRAIL", "TRL", "TRAILS", "TRLS", "TRAILER", "TRLR", "TRLRS", "TUNNEL", "TUNEL", "TUNL", "TUNLS", "TUNNELS", "TUNNL", "TURNPIKE", "TRNPK", "TPKE", "TURNPK", "UNDERPASS", "UPAS", "UNION", "UN", "UNIONS", "UNS", "VALLEY", "VLY", "VALLY", "VLLY", "VALLEYS", "VLYS", "VIADUCT", "VDCT", "VIA", "VIADCT", "VIEW", "VW", "VIEWS", "VWS", "VILLAGE", "VILL", "VLG", "VILLAG", "VILLG", "VILLIAGE", "VILLAGES", "VLGS", "VILLE", "VL", "VISTA", "VIS", "VIST", "VST", "VSTA", "WALK", "WALKS", "WALL", "WAY", "WY", "WAYS", "WELL", "WL", "WELLS", "WLS"]