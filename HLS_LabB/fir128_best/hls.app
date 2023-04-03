<project xmlns="com.autoesl.autopilot.project" top="fir" name="fir128_best">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../fir_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="fir128_best/out.gold.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_best/input.dat" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_best/fir.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="fir128_best/fir.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="coef_int" status="inactive"/>
        <solution name="coef_5bits" status="inactive"/>
        <solution name="merge" status="active"/>
    </solutions>
</project>

