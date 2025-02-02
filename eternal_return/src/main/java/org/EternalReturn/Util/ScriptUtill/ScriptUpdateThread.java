package org.EternalReturn.Util.ScriptUtill;

public class ScriptUpdateThread implements Runnable {

    private final Script script;

    public ScriptUpdateThread(Script script){
        this.script = script;
    }

    @Override
    public void run() {
        script.update();
    }
}
