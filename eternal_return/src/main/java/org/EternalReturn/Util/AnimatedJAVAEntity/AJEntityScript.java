package org.EternalReturn.Util.AnimatedJAVAEntity;

import org.EternalReturn.Util.ScriptUtill.Script;
import org.EternalReturn.Util.ScriptUtill.ScriptUpdateThread;

import java.util.List;

public class AJEntityScript implements Script {

    private AJEntityManager ajEntityManager = AJEntityManager.getInstance();

    @Override
    public void update() {
        List<AJEntity> ajEntities = ajEntityManager.getAjEntities();
        for(AJEntity ajEntity : ajEntities){
            ajEntity.script();
        }
    }



}
