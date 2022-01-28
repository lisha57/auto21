import static org.junit.jupiter.api.Assertions.*;

class FooTest {

    @org.junit.jupiter.api.Test
    void myMethod() {
        assertFalse(Foo.myMethod());
    }

    @org.junit.jupiter.api.Test
    void myFalseMethod() {
        assertFalse(Foo.myMethod());
    }
}
