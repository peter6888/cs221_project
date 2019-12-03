input="/Users/pe.li/stock/good_tics.txt"
while IFS= read -r line
do
  echo "$line"
curl 'https://snapshot.fidelity.com/fidresearch/snapshot/landing.jhtml' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'Origin: https://snapshot.fidelity.com' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Referer: https://snapshot.fidelity.com/fidresearch/gotoBL/snapshot/landing.jhtml?symbol=AMC' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,zh-TW;q=0.6' -H 'Cookie: XJSESSIONID=true; JSESSIONID=169ADF85E004A595E6C8693F7C8158B6; check=true; s_vi=[CS]v1|2E72DA4A85032E78-40001184A0000F2E[CE]; AMCVS_EDCF01AC512D2B770A490D4C%40AdobeOrg=1; _CT_RS_=Recording; WRUIDAWS=2309734427820393; pmcrtp=1915224586.4200.0000; zpc=RTP; GZIP=0; rpc=RTP2; wpc=RTP2; SGA=DONfYeDQ9di0wuWdm2tvk8xtOaOW4kRNMoa6XuKwhIfZ7Wjf1wq3GRBneZX7/+omPEM4wOsN1TLfnoPBG8u4CQVVnPx4/M4kZ6oAQUsjQxv5LCZnt9fRKaS3HO308FCqHMGy486o7A1FBPtK9A9pYwMEg9bjaM734btwkyrGS5WmXLu6f+HE90XIVeWYG1Jth19wWIzHUf2S/Eo8u+Nx7j7OQrduit6W0lVReVQTsB6gAnpevHDfmUcxKvc63dPtO3HtMMgp/xtws0d5xP3Y13lmjnr816EFiTli/THf3cg0BW6F+LyVAfHZSS9QzjnuTtrsIAmEv47tgbNtuGbndAyB1sm29tJuhPRc/ZKzA40RDoD8/f1O6UlLjOkuO7A/caT/KmsZ9tk6jxVJo8dDjnav3IpZmwgJn38zr7BKcfuKvL5R0Ew+ousGizAtfOVI; SGI=gBQCM8DnIRdRXxOD1AnstMyFeYwmwiVOl0Iyu+KE+JCSrbAvtYLvF6cjuD/VRF9r9/sQH2IVnSg=; SGT=14MTU2MTU3NDQyMA6jEU^CmSAcfa_yxibPXXMVn01No; _gcl_au=1.1.895087479.1561849268; _ga=GA1.2.422552187.1561849268; aam_uuid=84378950080597368832824148824412713929; cinfo=mstatus[N]:ctype[X]; cvi=p1=5ce5b4930a0224112000a1bb0009aa33&p2=ee456a2e0e9a1411e18d369bc8b53daa77&p3=01&p4=06&p5=&p6=&p7=ee456a2e0e9a1411e18d369bc8b53daa77&p8=06&p21=&p22=&p99=; uuid=d8956709-03e1-469c-9413-ff0b8c16ce2d; _gid=GA1.2.535304546.1562297644; FC=c79WsGYzHN^Vk9elsVvQ9BGKneF8APO0_XHHq1^LsjRo3dUOJjkJf1V07DzmP6JEpJLt7o4Qm2sJwF5LdPeLbJosZztgsWgHs7KODa0RDaFQohhApNO7Q71VIGEzZnC3gtC9dL1V9xjkLWQP^odEswmCjGcgzsgE2Hf3JFpWQmBDDavWFwymv^R5GerE9MeadUfXdviVVcQBhCCJSMsbnOfgFFm3E07liEOIsJn628DBMGn_7LCpnoQq9priYVUvKr9Y7E6Yv7BLYXDP5ydDEqZhtUTaWe9w0d17Hc_DVgnW03FBjNUCHB2mcaAeZFa6mXgdNPNOrj9WdXWrNgrJrvZLpQ8YRL5gDO_MROr9QRTUfnYx8vHBppbazck7Up^KP03; MC=fDgm3KnG2IwCY_JY4Rzn_lauIXMSAlzltJMKAiQRIAChuwAJqjMGBAAKADIGBV0ffXkABgkAAAABBwoABQUFABMN7kVqLg6aFBHhjTabyLU9qncDEQYLG2RmLmNoZi5yYQIcAAAAAAAAAyYBAyoBAAAAAAAAP03; RC=1BTDk3wKYbJu0ua1P3iUhU_GHi6L4HTmDqGD8xeT3k_x1Cx1FCdCxKzQB9uT6LXH1^HFaYD3B2GEhOoPH30tIL7MEVrdyzLLWTwNAe1nRoFu0RJ8gHTVkXUnQHiSejETl_6ElgtFIYGmnIQbEm2ZGGSE9^s4f6Cr2iF_8Iy6XbqzNNrY_zX8sHL^1qqn4TNgw0NiWzNMkRob2QSqPimCQrBvghHVKAb5v3cnJT0aAPZ7Mt63td8PLnkHH0JLag^dkKgaoBR6uskveMJN150Hj1oViSvWEo7ffxHbRFwM65hFph9M8ZWw2qvARDiKonY_xQS9okjXJG9marzAdM7qi_EOV^oCgOewg4kGWNqo^9w^n1QIQNNuJzphoRA_bAI71kmykPq0yCPodoJBBB^ZY6UCK3W7dRLwz22EdP75deGr9T_wHeBu9sgnHmzmzxRgQ0cfdnLfwANS0zWeRkTBxSoVa617vmNOQLAk8v^Bh1Fq1TB__fwDcVoXAF72wdOjTSBKdOmXMiW1eWkqgXxyaElXySJmQvGMYCvvSnikxC0dqhb8YYdhAi2CCbzPU7dcsBvRutEUgbReEhyQzBHhyMKrIu1gLgbXxFc2U70PK1mmJPll4U^L4LBMB0UcjWpc9dUpmXsyXhcF021QFSAoRhZjXIrm34RSad1GhFwYtw^j36prXRSVlv_AeC2CroqU82zIP70JZJOjgcZVlR0t0UEqBZaXY26Lst0T6lL0A2MiN20jeRI9nAz8ByjhlYCawHn6PeUOZ8B56lyFv1x8W_3LJbRFhMZiom2ME8z2lNkJo97D3lSXxn09pOKauf7_iddbV6axadEJQ7wTHcUbK2rqoJ8YftCb_Y4M1Bn_JoKIQ218y5Z8f40b0v7yX3VVgG6I^HgE1rpSGpIXHqi8Gw8mxCSwmYfJ10bkcMnIKgmhaY7umRYf_m716kv_hEAYwbVDxc1D7gOVfGMGLdJGXLmmzX4LPKdH2QxuMq2g1v3JN5ZVwshFcojGQ7jEOSt0SyuoEyEC6Yqk2OByP75tAXeAV4CmZG8Wwk0HEMk4_pPoLuo83MBuX6^4WGuAg7DXAWMr_8mJsEPfOAwpuIXo3wCGUMthSzUjO5^J0xe9TyS5phhEpZGn85RiCPMVjZrdZ9eTPqtTNDTxZs2^^^v1jvN8xJ^HubGOcknad2oPXx_Y5pKC_RsoFD1MJpsG8iz4lxl^ft9DYbOJTmYjL_rSUKsx2yQfDKJaUHpHnL7lBBORv68WAeQOU_TmsfFMGFONeZ1107GTORfVE2KrRCTP123uMc9ofDICP4FCxJLUhAXhCMPN5RrodZxOJ92ZTZnw4DqAAkDvsMlMxiXHrHINy2HJgUEdZ_7FleG5AYQkQXPSlo2odtPOqtfgcS0cKRwbsJRh2rycxgsx77aMqjppb01ar0fMxdcGElKsXRqAyQ^SqVuODv8UD8Uu_DOVfCqQNZgOTs6Ine9cdKLeZxsB43fy7^E1Jfuu99q^IPxlzxqp^n9pi7zkN3GAlFuqAxOR_hzSp38yP5cP03; SC=nyp7q1n6TqYeNYVt_jEBI3Eq1i5WN05_7uwO8aRpKAg7vAo8BXwSzD8xCETGLp8yxsA5W002YomMs4w4bwUokslgpYNLWcg6bs8WsZmx1wjBMRWh1fqy7symm2zDF9uvloz6BwjzffoDId^wDMKSJKXW95U^o1QSC0VkN4P0Q4HiKQzJxjiVEqDagRaGNiteJ6u5OpudZi7fOvCHJ_fDvb4qck2ZZuFNkB1DO0yM1RIeW_NpPsr_kz3PJRdcBRKoP03; RtEntC=A1PODzpW0XGm43Pw0EleoDNxhVkY4tRaFOozLzSJ7oOCnKCocu99WN9S8JpwFHeFD0bLRL5YGk^OwC96jcWqgJzrZZH87zf4DfoM3OkoRa2qGp3^j5YdDpPXFCHPDJQBag; AKA_A2=A; 736%5F0=00AE83EB49941A96B1A78743AAE77F1E1261E8AB9C687CC5A3F51F06FB012813; aam_uuid=84378950080597368832824148824412713929; QSI_HistorySession=https%3A%2F%2Fresearch2.fidelity.com%2Ffidelity%2Fresearch%2Freports%2Frelease2%2FResearch%2FRefinitivStarMine.asp~1562344947114%7Chttps%3A%2F%2Fsnapshot.fidelity.com%2Ffidresearch%2Fsnapshot%2Flanding.jhtml%23%2Fanalystsopinions%3Fsymbol%3DMSFT~1562345216344; mbox=PC#6b602568bdcc414d823b5a94d2dbfb4e.28_34#1625590583|session#7720ba6492f141f6900d3016c472703e#1562347643; AMCV_EDCF01AC512D2B770A490D4C%40AdobeOrg=-330454231%7CMCAID%7C2E72DA4A85032E78-40001184A0000F2E%7CMCIDTS%7C18082%7CMCMID%7C90265958320264057423417354418368097172%7CMCAAMLH-1562950582%7C9%7CMCAAMB-1562950582%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1562352023s%7CNONE%7CvVersion%7C3.1.2%7CMCCIDH%7C1448878280; s_pers=%20visitStart%3D1560434729771%7C1591970729771%3B%20gpv_c11%3DFid.com%2520web%257Cresearch%257Cstocks%257CSnapshot%2520N%7C1562347582952%3B; s_sess=%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_sq%3D%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B; __CT_Data=gpv=32&ckp=tld&dm=fidelity.com&apv_178_www43=106&cpv_178_www43=106&rpv_178_www43=106; AAMC_fidelity_0=REGION%7C7%7CAMSYNCSOP%7C%7CAMSYNCS%7C; _abck=0524B6A188D72E00C6BDA94E178DBA8C~-1~YAAQNWE0FwzaqZFrAQAA4sEQwwIKEcN4rX7LfPaeJbSczfp3mRuB5sD0AW4F7+gFoxLSSxy1IkwYex1h5PPyXM5zOGaaJRWV4oVuCfiHOe38fOci1eFONBBaNkfMo+BZ31idy597p1XjtoXrekdGW7iAuvB3TTZqhSU16Mce7ZogJr5LXjCgtdtCSZtTePFml+PKTawrBjfmMYGpaGAg5dQa24Jbys+wkVoZL3wHravjpf6cWqpx5f//EWIYbdh+CDaivi98VpLeN91IM3kVQGzn+Udv27BVyxjY3Bb2~-1~-1~-1; bm_sz=95E447203F4657406ABBD19D5C1854FF~YAAQNWE0FwvaqZFrAQAA4sEQwwSurgVY3V/Pvm9ytq/WtLsjhKPTZUBcHISDpZbKye1k6WkXesHfS0A96X6l+x7Ib20N/sk0uC1FKUpICr6n8CQc/yp79ag/j91GyU0xDYkWgRdbsCzAWajcTUBmkmK/+7MuIQAyZdYb7Pyqmlz0IDEioQgIGuC3XDeo2jDgrLU=; ATC=GqFgUXTvno4S7YJllq4kg1jMjEVdH4E4XR^PSF0ffXk' --data 'symbol=AMC&appId=' --compressed
curl 'https://snapshot.fidelity.com/fidresearch/snapshot/landing.jhtml' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'Origin: https://snapshot.fidelity.com' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H "Referer: https://snapshot.fidelity.com/fidresearch/gotoBL/snapshot/landing.jhtml?symbol=${line}" -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,zh-TW;q=0.6' -H 'Cookie: XJSESSIONID=true; JSESSIONID=169ADF85E004A595E6C8693F7C8158B6; check=true; s_vi=[CS]v1|2E72DA4A85032E78-40001184A0000F2E[CE]; AMCVS_EDCF01AC512D2B770A490D4C%40AdobeOrg=1; _CT_RS_=Recording; WRUIDAWS=2309734427820393; pmcrtp=1915224586.4200.0000; zpc=RTP; GZIP=0; rpc=RTP2; wpc=RTP2; SGA=DONfYeDQ9di0wuWdm2tvk8xtOaOW4kRNMoa6XuKwhIfZ7Wjf1wq3GRBneZX7/+omPEM4wOsN1TLfnoPBG8u4CQVVnPx4/M4kZ6oAQUsjQxv5LCZnt9fRKaS3HO308FCqHMGy486o7A1FBPtK9A9pYwMEg9bjaM734btwkyrGS5WmXLu6f+HE90XIVeWYG1Jth19wWIzHUf2S/Eo8u+Nx7j7OQrduit6W0lVReVQTsB6gAnpevHDfmUcxKvc63dPtO3HtMMgp/xtws0d5xP3Y13lmjnr816EFiTli/THf3cg0BW6F+LyVAfHZSS9QzjnuTtrsIAmEv47tgbNtuGbndAyB1sm29tJuhPRc/ZKzA40RDoD8/f1O6UlLjOkuO7A/caT/KmsZ9tk6jxVJo8dDjnav3IpZmwgJn38zr7BKcfuKvL5R0Ew+ousGizAtfOVI; SGI=gBQCM8DnIRdRXxOD1AnstMyFeYwmwiVOl0Iyu+KE+JCSrbAvtYLvF6cjuD/VRF9r9/sQH2IVnSg=; SGT=14MTU2MTU3NDQyMA6jEU^CmSAcfa_yxibPXXMVn01No; AAMC_fidelity_0=REGION%7C9%7CAMSYNCSOP%7C%7CAMSYNCS%7C; _gcl_au=1.1.895087479.1561849268; _ga=GA1.2.422552187.1561849268; aam_uuid=84378950080597368832824148824412713929; cinfo=mstatus[N]:ctype[X]; cvi=p1=5ce5b4930a0224112000a1bb0009aa33&p2=ee456a2e0e9a1411e18d369bc8b53daa77&p3=01&p4=06&p5=&p6=&p7=ee456a2e0e9a1411e18d369bc8b53daa77&p8=06&p21=&p22=&p99=; uuid=d8956709-03e1-469c-9413-ff0b8c16ce2d; _gid=GA1.2.535304546.1562297644; FC=c79WsGYzHN^Vk9elsVvQ9BGKneF8APO0_XHHq1^LsjRo3dUOJjkJf1V07DzmP6JEpJLt7o4Qm2sJwF5LdPeLbJosZztgsWgHs7KODa0RDaFQohhApNO7Q71VIGEzZnC3gtC9dL1V9xjkLWQP^odEswmCjGcgzsgE2Hf3JFpWQmBDDavWFwymv^R5GerE9MeadUfXdviVVcQBhCCJSMsbnOfgFFm3E07liEOIsJn628DBMGn_7LCpnoQq9priYVUvKr9Y7E6Yv7BLYXDP5ydDEqZhtUTaWe9w0d17Hc_DVgnW03FBjNUCHB2mcaAeZFa6mXgdNPNOrj9WdXWrNgrJrvZLpQ8YRL5gDO_MROr9QRTUfnYx8vHBppbazck7Up^KP03; MC=fDgm3KnG2IwCY_JY4Rzn_lauIXMSAlzltJMKAiQRIAChuwAJqjMGBAAKADIGBV0ffXkABgkAAAABBwoABQUFABMN7kVqLg6aFBHhjTabyLU9qncDEQYLG2RmLmNoZi5yYQIcAAAAAAAAAyYBAyoBAAAAAAAAP03; RC=1BTDk3wKYbJu0ua1P3iUhU_GHi6L4HTmDqGD8xeT3k_x1Cx1FCdCxKzQB9uT6LXH1^HFaYD3B2GEhOoPH30tIL7MEVrdyzLLWTwNAe1nRoFu0RJ8gHTVkXUnQHiSejETl_6ElgtFIYGmnIQbEm2ZGGSE9^s4f6Cr2iF_8Iy6XbqzNNrY_zX8sHL^1qqn4TNgw0NiWzNMkRob2QSqPimCQrBvghHVKAb5v3cnJT0aAPZ7Mt63td8PLnkHH0JLag^dkKgaoBR6uskveMJN150Hj1oViSvWEo7ffxHbRFwM65hFph9M8ZWw2qvARDiKonY_xQS9okjXJG9marzAdM7qi_EOV^oCgOewg4kGWNqo^9w^n1QIQNNuJzphoRA_bAI71kmykPq0yCPodoJBBB^ZY6UCK3W7dRLwz22EdP75deGr9T_wHeBu9sgnHmzmzxRgQ0cfdnLfwANS0zWeRkTBxSoVa617vmNOQLAk8v^Bh1Fq1TB__fwDcVoXAF72wdOjTSBKdOmXMiW1eWkqgXxyaElXySJmQvGMYCvvSnikxC0dqhb8YYdhAi2CCbzPU7dcsBvRutEUgbReEhyQzBHhyMKrIu1gLgbXxFc2U70PK1mmJPll4U^L4LBMB0UcjWpc9dUpmXsyXhcF021QFSAoRhZjXIrm34RSad1GhFwYtw^j36prXRSVlv_AeC2CroqU82zIP70JZJOjgcZVlR0t0UEqBZaXY26Lst0T6lL0A2MiN20jeRI9nAz8ByjhlYCawHn6PeUOZ8B56lyFv1x8W_3LJbRFhMZiom2ME8z2lNkJo97D3lSXxn09pOKauf7_iddbV6axadEJQ7wTHcUbK2rqoJ8YftCb_Y4M1Bn_JoKIQ218y5Z8f40b0v7yX3VVgG6I^HgE1rpSGpIXHqi8Gw8mxCSwmYfJ10bkcMnIKgmhaY7umRYf_m716kv_hEAYwbVDxc1D7gOVfGMGLdJGXLmmzX4LPKdH2QxuMq2g1v3JN5ZVwshFcojGQ7jEOSt0SyuoEyEC6Yqk2OByP75tAXeAV4CmZG8Wwk0HEMk4_pPoLuo83MBuX6^4WGuAg7DXAWMr_8mJsEPfOAwpuIXo3wCGUMthSzUjO5^J0xe9TyS5phhEpZGn85RiCPMVjZrdZ9eTPqtTNDTxZs2^^^v1jvN8xJ^HubGOcknad2oPXx_Y5pKC_RsoFD1MJpsG8iz4lxl^ft9DYbOJTmYjL_rSUKsx2yQfDKJaUHpHnL7lBBORv68WAeQOU_TmsfFMGFONeZ1107GTORfVE2KrRCTP123uMc9ofDICP4FCxJLUhAXhCMPN5RrodZxOJ92ZTZnw4DqAAkDvsMlMxiXHrHINy2HJgUEdZ_7FleG5AYQkQXPSlo2odtPOqtfgcS0cKRwbsJRh2rycxgsx77aMqjppb01ar0fMxdcGElKsXRqAyQ^SqVuODv8UD8Uu_DOVfCqQNZgOTs6Ine9cdKLeZxsB43fy7^E1Jfuu99q^IPxlzxqp^n9pi7zkN3GAlFuqAxOR_hzSp38yP5cP03; SC=nyp7q1n6TqYeNYVt_jEBI3Eq1i5WN05_7uwO8aRpKAg7vAo8BXwSzD8xCETGLp8yxsA5W002YomMs4w4bwUokslgpYNLWcg6bs8WsZmx1wjBMRWh1fqy7symm2zDF9uvloz6BwjzffoDId^wDMKSJKXW95U^o1QSC0VkN4P0Q4HiKQzJxjiVEqDagRaGNiteJ6u5OpudZi7fOvCHJ_fDvb4qck2ZZuFNkB1DO0yM1RIeW_NpPsr_kz3PJRdcBRKoP03; RtEntC=A1PODzpW0XGm43Pw0EleoDNxhVkY4tRaFOozLzSJ7oOCnKCocu99WN9S8JpwFHeFD0bLRL5YGk^OwC96jcWqgJzrZZH87zf4DfoM3OkoRa2qGp3^j5YdDpPXFCHPDJQBag; AKA_A2=A; 736%5F0=00AE83EB49941A96B1A78743AAE77F1E1261E8AB9C687CC5A3F51F06FB012813; mbox=PC#6b602568bdcc414d823b5a94d2dbfb4e.17_96#1625589634|session#7720ba6492f141f6900d3016c472703e#1562346804; aam_uuid=84378950080597368832824148824412713929; _abck=CFD229D696D69EEF30BBCB2922581705~-1~YAAQBQ0QYKlwJ7JrAQAAw/EDwwJ5PujV01QNcNyMl0qZcM0liLWORAuEsHk3Di0NbysSG0yP0z0WztEWfNeo4wEEAKJ/TJjQJvTCCUiRZ3yTYGN62HkO+lXf754ECTISh5akmsYFBnRF446CSX6izaXyuYD1OaNcb4BQNZ7Z17rpl06oOq7NrW9bkWr0FZtbNfEWz97KTZK5xU5H/UZ/zN607fHcCRSUpqz5OGWGy8G+1XJksm9WPBMW2ma1qRri4QSLFV2s6B8+84dq/77+wpVSWPQM9WOKvA+RZf4B~-1~-1~-1; bm_sz=B9E0A21EB1FCBE7DC08F70D87983ECB0~YAAQBQ0QYKhwJ7JrAQAAw/EDwwSvwzTz4k9bFCAiw2xWyq901qpxfffjSZ1rpE44Cqa02hvoSdAm9FArkn4wWWt0Sw9b76WUqbF60iWsuOQnPDklUMb9VI9VSvBeZI12fkn6+OWXCJagB8zn0qaX+fQZ5cqy9X9UF0RfGVbmKXo8uo2Xy1IbhpbsfKLDuTRMSo4=; AMCV_EDCF01AC512D2B770A490D4C%40AdobeOrg=-330454231%7CMCAID%7C2E72DA4A85032E78-40001184A0000F2E%7CMCIDTS%7C18082%7CMCMID%7C90265958320264057423417354418368097172%7CMCAAMLH-1562949746%7C9%7CMCAAMB-1562949746%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1562352023s%7CNONE%7CvVersion%7C3.1.2%7CMCCIDH%7C1448878280; s_pers=%20visitStart%3D1560434729771%7C1591970729771%3B%20gpv_c11%3DFid.com%2520web%257Cresearch%257Cstocks%257CResearch%2520Firm%2520Details%7C1562346746462%3B; s_sess=%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_sq%3D%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B%20s_cc%3Dtrue%3B; QSI_HistorySession=https%3A%2F%2Fresearch2.fidelity.com%2Ffidelity%2Fresearch%2Freports%2Frelease2%2FResearch%2FRefinitivStarMine.asp~1562344947114; ATC=CrcoXfG4QtsZzCR1M0sZCnDExZhdH33zXR^MA10ffXk; __CT_Data=gpv=30&ckp=tld&dm=fidelity.com&apv_178_www43=104&cpv_178_www43=104&rpv_178_www43=104' --data "symbol=${line}appId=" --compressed >${line}_fidelity.html
#curl "https://www.americanbulls.com/members/SignalPage.aspx?lang=en&Ticker=${line}" -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'DNT: 1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Referer: https://www.americanbulls.com/members/Default.Aspx?lang=en' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,zh-TW;q=0.6' -H 'Cookie: ASP.NET_SessionId=ipbrb0idczvs25r14n2kywj1; _ga=GA1.2.1651777929.1560038228; _gid=GA1.2.2077168228.1561935393; UserSettings=uEmail=cgrass123@hotmail.com&uPassword=kpjfka888732878g2afqfoOn21jfk2P3&uRememberMe=1; SessionToken=SessionTokenID=ipbrb0idczvs25r14n2kywj120190630' --compressed > ${line}.html
#  curl "https://stock.xueqiu.com/v5/stock/quote.json?symbol=${line}&extend=detail" -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36' -H 'DNT: 1' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7,zh-TW;q=0.6' -H 'Cookie: s=br177zoj1o; u=771561223266948; device_id=75e4a0874c31073252e297f868fc758b; xq_a_token=843ee4cdac90d25a81f0c525979473f0d8be0e33; xq_r_token=274258ddbb848be0d8ae9ed9fc1e8a019c0d6310; Hm_lvt_1db88642e346389874251b5a1eded6e3=1561437663,1561437994,1561438125,1561516393; Hm_lpvt_1db88642e346389874251b5a1eded6e3=1561528829' --compressed > ${line}_quote.json
done < "$input"
