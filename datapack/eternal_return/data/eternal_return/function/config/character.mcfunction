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
        {no:2,name:"adriana"},{no:3,name:"alex"},{no:4,name:"arda"},{no:5,name:"bernice"},{no:6,name:"bianca"},\
        {no:7,name:"celine"},{no:8,name:"chloe"},{no:9,name:"daniel"},{no:10,name:"elena"},{no:11,name:"hart"},\
        {no:12,name:"hyunwoo"},{no:13,name:"isol"},{no:14,name:"jackie"},{no:15,name:"jenny"},{no:16,name:"katja"},\
        {no:17,name:"leni"},{no:18,name:"lenox"},{no:19,name:"leon"},{no:20,name:"luke"},{no:21,name:"lyanh"},\
        {no:22,name:"magnus"},{no:23,name:"markus"},{no:24,name:"nadine"},{no:25,name:"nathapon"},{no:26,name:"piolo"},\
        {no:27,name:"shou"},{no:28,name:"silvia"},{no:29,name:"sissela"},{no:30,name:"vanya"},{no:31,name:"yuki"},\
        {no:32,name:"estelle"}]

## 캐릭터 별 스탯
    # 쇼우
        scoreboard players set #shou.active.cool NUM 10
        scoreboard players set #shou.active.damage NUM 10
        scoreboard players set #shou.passive.cool NUM 5
        scoreboard players set #shou.passive.damage NUM 2