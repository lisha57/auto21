import static org.junit.jupiter.api.Assertions.*;

class FooTest {

    @org.junit.jupiter.api.Test
    void myMethod() {
        assertTrue(Foo.myMethod());
    }

    @org.junit.jupiter.api.Test
    void myFalseMethod() {
        assertFalse(Foo.myMethod());
    }
}
