resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

files {
    'handling.meta',
    'vehiclelayouts_ae86.meta',
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'materials.dat',
--  ELS VCF  --
    'VCF/POLICE.xml',
    'VCF/police2.xml',
    'VCF/POLICE3.xml',
    'VCF/POLICE4.xml',
    'VCF/fbi.xml',
    'VCF/SHERIFF.xml',
    'VCF/policeold2.xml',
    'VCF/ambulance.xml',
}

data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'vehiclelayouts_ae86.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'MATERIALS_FILE' 'materials.dat'


is_els 'true'