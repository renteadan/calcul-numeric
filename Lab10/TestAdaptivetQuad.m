a = 1; b = 2;
f = @(x) 1/x;
e = 0.00001;

AdaptiveQuad(f,a,b,e,@RegulaDreptunghiului)
AdaptiveQuad(f,a,b,e,@RegulaLuiSimpson)
AdaptiveQuad(f,a,b,e,@RegulaTrapezului)