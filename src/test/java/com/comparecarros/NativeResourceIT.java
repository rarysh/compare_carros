package com.comparecarros;

import io.quarkus.test.junit.NativeImageTest;

@NativeImageTest
public class NativeResourceIT extends ResourceTest {
    // Execute the same tests but in native mode.
    // Only Endpoints Tests will work
}
