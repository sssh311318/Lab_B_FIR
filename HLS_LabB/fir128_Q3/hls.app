<project xmlns="com.autoesl.autopilot.project" name="fir128_Q3" top="fir">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../fir_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="fir128_Q3/fir.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q3/fir.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q3/input.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q3/out.gold.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="before" status="active"/>
        <solution name="after" status="inactive"/>
    </solutions>
</project>

