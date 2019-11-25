-- General
isInHospitalBed = false

-- Hospital
bedOccupying = nil
bedObject = nil
bedOccupyingData = nil
currentTp = nil
usedHiddenRev = false

-- Wound
isBleeding = 0
bleedTickTimer, advanceBleedTimer = 0, 0
fadeOutTimer, blackoutTimer = 0, 0

onPainKiller = 0
wasOnPainKillers = false

onDrugs = 0
wasOnDrugs = false

legCount = 0
armcount = 0
headCount = 0

playerHealth = nil
playerArmour = nil

limbNotifId = 'MHOS_LIMBS'
bleedNotifId = 'MHOS_BLEED'
bleedMoveNotifId = 'MHOS_BLEEDMOVE'

BodyParts = {
    ['HEAD'] = { label = 'Huvudet: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['NECK'] = { label = 'Nacken: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['SPINE'] = { label = 'Ryggraden: ', causeLimp = true, isDamaged = false, severity = 0 },
    ['UPPER_BODY'] = { label = 'Bröstet: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['LOWER_BODY'] = { label = 'Magen: ', causeLimp = true, isDamaged = false, severity = 0 },
    ['LARM'] = { label = 'Vänster Arm: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['LHAND'] = { label = 'Vänster Hand: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['LFINGER'] = { label = 'Fingrarna på vänster hand: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['LLEG'] = { label = 'Vänster Ben: ', causeLimp = true, isDamaged = false, severity = 0 },
    ['LFOOT'] = { label = 'Vänster Fot: ', causeLimp = true, isDamaged = false, severity = 0 },
    ['RARM'] = { label = 'Höger Arm: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['RHAND'] = { label = 'Höger Hand: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['RFINGER'] = { label = 'Fingrarna på höger hand: ', causeLimp = false, isDamaged = false, severity = 0 },
    ['RLEG'] = { label = 'Höger Ben: ', causeLimp = true, isDamaged = false, severity = 0 },
    ['RFOOT'] = { label = 'Höger Fot: ', causeLimp = true, isDamaged = false, severity = 0 },
}

injured = {}