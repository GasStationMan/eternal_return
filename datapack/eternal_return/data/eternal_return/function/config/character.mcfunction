## 캐릭터 스탯 설정
# 상위 함수 : function eternal_return:load

# 캐릭터를 추가하는 방법
# 1. 캐릭터 스탯 배열에 번호를 1씩 줄이고 추가한다.
# 2. 캐릭터 리스트에 번호를 1씩 더하고 추가한다.
# 3. 캐릭터 스탯에 넣은 번호는 리소스팩에 font/gui/character/line1~3에 있는 곳에 \u69xx(선택안됨) \u64xx(선택됨)을 적어둔다. [총 6개]
# 4. 캐릭터 프로필을 font/gui/character/profile에 

## 캐릭터 갯수
    scoreboard players set #charater.count NUM 31
    
####################################### 건들지 마시오 ###################################
        scoreboard players operation #charater.count+1 NUM = #charater.count NUM
        scoreboard players operation #charater.count-4 NUM = #charater.count NUM
        scoreboard players add #charater.count+1 NUM 1
        scoreboard players remove #charater.count-4 NUM 4
#######################################################################################

## 캐릭터 선택 배열
    data modify storage config character_array set value \
    [[999,998,997,996,995],\
    [994,993,992,991,990],\
    [989,988,987,986,985],\
    [984,983,982,981,980],\
    [979,978,977,976,975],\
    [974,973,972,971,970],\
    [969,968,0,0,0]]

## 캐릭터 리스트
    data modify storage config character_list set value [\
        {no:2,name:"adriana",\
            aname:"a",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"p",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:3,name:"alex",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:4,name:"arda",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:5,name:"bernice",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:6,name:"bianca",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:7,name:"celine",\
            aname:"플라즈마 폭탄",alore1:"F키로 지정한 위치에(바닥)에 폭탄을 설치합니다.",alore2:"Q키로 설치된 폭탄과 인근 폭탄이 융합되며 터집니다. 인근 폭탄이 없을시에 융합되지 않고 바로 터집니다.",alore3:"융합단계별 폭탄 피해량 및 효과 : 1단계 4/5/6/7/8 ,2단계 6/7/8/9/10(슬로우) ,3단계 10/11/12/13/14(강한슬로우)",acool:0,alevel:0,\
            pname:"폭발물 전문가",plore1:"셀린의 공격이 적에게 적중하면 플라즈마 폭탄의 보유량이 1개 증가됩니다.",plore2:"폭탄은 최대 3개까지 보유되고 설치될 수 있습니다. (경우의수 : 1단계 3개 // 2단계 1개, 1단계 1개 // 3단계 1개)",plore3:"폭탄 충전 내부쿨타임 10/9/8/7/5",pcool:0,plevel:0},\/
        {no:8,name:"chloe",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:9,name:"daniel",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:10,name:"elena",\
            aname:"죽음의 무도",alore1:"엘레나가 전방으로 죽음의 얼음지대를 7초간 생성합니다.",alore2:"죽음의 얼음지대 위에서 엘레나는 화염저항, 근접공격력 +3 추가효과를 받으며, 죽음의 얼음지대 또한 얼음지대효과를 공유합니다.",alore3:"쿨다운 60/55/50/45/40",acool:0,alevel:0,\
            pname:"겨울여왕의 영지",plore1:"엘레나가 지역과 지역사이를 오갈때 7초간 엘레나의 발자취에 짧게 유지되는 얼음지대를 생성합니다.",plore2:"얼음지대 위에서의 적은 냉기가 차올라 이동속도(%)가 15/15/30/30/45 느려집니다.",plore3:"엘레나는 피겨스케이팅을 통해 유연성을 길러 긴 리치를 가졌습니다. 기본사거리 : 3.5",pcool:0,plevel:0},\
        {no:11,name:"hart",\
            aname:"Flanger",alore1:"하트가 지정한 방향으로 짧게 이동한 후 근처 적에게 방어력을 관통하는 음파를 날려 피해를 입힙니다.",alore2:"5초내로 스킬을 재사용할 수 있습니다.",alore3:"쿨타임 30/28/26/24/20 , 방관피해량 : 1/2/3/4/5 ",acool:0,alevel:0,\
            pname:"Peacemaker",plore1:"하트가 낮에는 앰프를 소환해 'Love and Peace'버스킹을 하여 해당지역을 피스존으로 선언합니다.(1일차 낮은 제외)",plore2:"피스존에 있었던 실험체들은 15초간 재생효과와 근접공격력 -4의 효과를 받습니다. ",plore3:"피스존 내 하트만 받는 효과 재생,근공-4/재생,근공-4/재생/재생/재생2",pcool:0,plevel:0},\
        {no:12,name:"hyunwoo",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:13,name:"isol",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:14,name:"jackie",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:15,name:"jenny",\
            aname:"페르소나",alore1:"제니가 전방으로 짧은거리를 이동하며 배역을 전환합니다.",alore2:"전환된 배역에 따라 추가 효과를 획득합니다. 블랙티 : 이동속도 +20% , 근접공격력 -4 // 레드와인 : 공격속도 +10% ",alore3:"쿨타임 30/27/24/21/15",acool:0,alevel:0,\
            pname:"죽음의 연기",plore1:"제니의 체력이 0이되면 3초간 죽음의 연기상태가 됩니다.",plore2:"죽음의 연기 : 추가체력 4/4/8/8/12 , 화염저항 , 근접공격력 -4, 이동속도 -30%",plore3:"쿨타임 70(고정)",pcool:0,plevel:0},\
        {no:16,name:"katja",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:17,name:"leni",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:18,name:"lenox",\
            aname:"",alore1:" line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:19,name:"leon",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:20,name:"luke",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:21,name:"lyanh",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:22,name:"magnus",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:23,name:"markus",\
            aname:"지각변동",alore1:"마커스가 전방으로 도약해 지면을 내려찍습니다.",alore2:"피격당한 적들은 방어력을 관통하는 피해를 입으며 5초간 '충격' 상태가 되어 이동속도가 15% 느려집니다.",alore3:"쿨타임 50/45/40/35/30 , 방관피해량 4/5/6/7/8",acool:0,alevel:0,\
            pname:"전사의 투지",plore1:"적에게 스킬을 피격시에 마커스는 전사의 투지를 획득합니다.",plore2:"전사의 투지 : 공격속도 1/1.4/1.8/2.2/2.6 , 이동속도 +20/20/40/40/60%",plore3:"지속시간 7/8/9/10/12",pcool:0,plevel:0},\
        {no:24,name:"nadine",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:25,name:"nathapon",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:26,name:"piolo",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:27,name:"shou",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:28,name:"silvia",\
            aname:"",alore1:"",alore3:"",acool:0,alevel:0,\
            pname:"",plore1:"",plore2:"",plore3:"",pcool:0,plevel:0},\
        {no:29,name:"sissela",\
            aname:"모두 해방이에요.",alore1:"1.5초간 정신집중 후 시셀라 자신이 존재하는 지역에 있는 모든 실험체에게 방어력을 관통하는 피해를 줍니다.",alore2:"발동조건 : 최대체력의 40% 미만",alore3:"쿨타임 60/55/50/45/40 , 방관피해량 4/6/8/10/12",acool:0,alevel:0,\
            pname:"삷은 고통이에요.",plore1:"시셀라는 현재 체력이 낮아지면 낮아질수록 추가효과를 받습니다.",plore2:"체력 40% 미만일때 : 근접 공격력 +3 , 체력 20% 미만일때 근접 공격력 +6",plore3:"병들고 어린 시셀라는 팔이 짧습니다. 기본사거리 2.5",pcool:0,plevel:0},\
        {no:30,name:"vanya",\
            aname:"",alore1:"line1",alore2:"line2",alore3:"line3",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:31,name:"yuki",\
            aname:"화무십일홍(花無十日紅)",alore1:"유키가 검에 손을 가져가서 순식간에 공간을 베어 버립니다.",alore2:"피격당한 적에게 피해줌과 동시에 표시를 남기며 1초간 이동속도를 30%느려지게 한뒤, 유키가 검을 검집에 집어 넣는 순간 표식이 터지며 대상에게 방어력을 관통하는 피해를 입힙니다.",alore3:"쿨타임 60/55/50/45/40 , 피해량 4/5/6/7/8 , 방관피해량 6/7/8/9/10",acool:0,alevel:0,\
            pname:"",plore1:"line1",plore2:"line2",plore3:"line3",pcool:0,plevel:0},\
        {no:32,name:"estelle",\
            active:\
            {name:"",lore1:"line1",lore2:"line2",lore3:"line3",cool:0},\
            passive:\
            {name:"",lore1:"line1",lore2:"line2",lore3:"line3",cool:0}}]

## 캐릭터 별 스탯
    # 쇼우
        scoreboard players set #shou.\
            active.cool NUM 10
        scoreboard players set #shou.\
            active.damage NUM 10
        scoreboard players set #shou.\
            passive.cool NUM 5
        scoreboard players set #shou.\
            passive.damage NUM 2