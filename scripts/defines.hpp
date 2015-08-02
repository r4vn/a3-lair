#define SAD_CACHE_VEHICLE "Land_Pallet_MilBoxes_F"
#define SAD_MAX_CACHES 10
#define SAD_NEEDED_CACHES 2

#define SAD_MIN_CACHE_DISTANCE 1000

#define GET_MARKER_ID(cacheId) format ["cache_area_%1", cacheId]
#define SAD_MIN_CACHE_MARKER_OFFSET 50
#define SAD_MAX_CACHE_MARKER_OFFSET 200

#define SAD_MAX_INTEL_DURATION 10

#define SAD_MAP_SIZE 6000
#define SAD_CACHE_BUILDINGS [\
    "Land_jbad_House1",\
    "Land_jbad_House2",\
    "Land_jbad_House3",\
    "Land_jbad_House5",\
    "Land_jbad_House6",\
    "Land_jbad_House7",\
    "Land_jbad_House8",\
    "Land_jbad_House_c_4",\
    "Land_jbad_House_c_5",\
    "Land_jbad_House_c_11",\
    "Land_jbad_House_3_old",\
    "Land_jbad_House_4_old",\
    "Land_jbad_House_6_old",\
    "Land_jbad_House_7_old",\
    "Land_jbad_House_8_old",\
    "Land_jbad_House_9_old"\
]

#define SAD_MAX_INS_GROUP_COUNT 5
#define SAD_INS_GROUPS [\
    (configFile >> "CfgGroups" >>  "Indep" >>\
            "rhs_faction_insurgents" >> "Infantry" >> "IRG_ReconSentry"),\
    (configFile >> "CfgGroups" >>  "Indep" >>\
            "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfSentry"),\
    (configFile >> "CfgGroups" >>  "Indep" >>\
            "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfTeam_AT"),\
    (configFile >> "CfgGroups" >>  "Indep" >>\
            "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfTeam_MG"),\
    (configFile >> "CfgGroups" >>  "Indep" >>\
            "rhs_faction_insurgents" >> "Infantry" >> "IRG_InfSquad"),\
    (configFile >> "CfgGroups" >>  "Indep" >> "rhs_faction_insurgents" >>\
            "rhs_group_indp_ins_ural" >> "rhs_group_chdkz_ural_chq")\
]

#define SAD_BASE_MARKER_NAME "west_base"
