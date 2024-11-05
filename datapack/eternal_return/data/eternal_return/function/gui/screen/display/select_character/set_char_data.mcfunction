## 캐릭터 배열과 프레임 배열 추가하기
function pdb:get_me
    data modify storage pdb:main in.character_array set value [[999,998,997,996,995],[994,993,992,991,990],[989,988,987,986,985],[984,983,982,981,980],[979,978,977,976,975],[974,973,972,971,970],[969,0,0,0,0]]
    data modify storage pdb:main in.character_array_frame set value [[0],[1],[2]]
function pdb:save_me