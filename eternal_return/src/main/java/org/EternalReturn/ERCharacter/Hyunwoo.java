package org.EternalReturn.ERCharacter;

public class Hyunwoo extends ERCharacter{

    @Override
    public void script() {

        for(CharacterEvent e = this.consumeEvent() ; !(this.submittedEvent.isEmpty()) ; e = this.consumeEvent()){
            if (e instanceof CharacterAttackEvent attackEvent){
                this.onAttack(attackEvent);
            }
        }

    }

    private void onAttack(CharacterAttackEvent attackEvent){

    }

}
