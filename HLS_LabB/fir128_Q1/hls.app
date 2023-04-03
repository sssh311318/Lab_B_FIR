<project xmlns="com.autoesl.autopilot.project" name="fir128_Q1" top="fir">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../fir_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="fir128_Q1/fir.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q1/fir.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q1/input.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_Q1/out.gold.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="32bit" status="inactive"/>
        <solution name="16bit" status="inactive"/>
        <solution name="8bit" status="inactive"/>
        <solution name="64bit" status="active"/>
    </solutions>
</project>

