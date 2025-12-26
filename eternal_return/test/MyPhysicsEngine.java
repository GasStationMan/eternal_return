

public class MyPhysicsEngine extends PhysicsEngine {
    
    public static void main(String[] args){
        MyPhysicsEngine engine = new MyPhysicsEngine();
        engine.update();
    }

    public void update(){

        Vector3 vec0 = new_Vector3(1,2,3);
        Vector3 vec1 = new_Vector3(1,2,3);
        Vector3 vec2 = new_Vector3(0,0,0);

        add(vec2, vec0, vec1);
        add(vec2, vec0, vec1);
        add(vec2, vec0, vec1);
        add(vec2, vec0, vec1);


        System.out.println(str(vec2));

    }

}
