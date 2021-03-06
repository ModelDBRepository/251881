:2019: From ModelDB no. 139653 
: Modified cainf by Elisabetta Iavarone @ Blue Brain Project
: See PARAMETER section for references

NEURON {
	SUFFIX TC_cad
	USEION ca READ ica WRITE cai
	RANGE depth,kt,kd,cainf,taur, cai_rec, gamma
}

UNITS {

	(mM)	= (milli/liter)
	(um)	= (micron)
	(mA)	= (milliamp)
	(msM)	= (ms mM)
	FARADAY = (faraday) (coulombs)
}

PARAMETER {
	depth	= .1	 (um)		: depth of shell
	gamma   = 0.05 	 (1)		: EI: percent of free calcium (not buffered)
	taur	= 5	 (ms)		: rate of calcium removal
	cainf	= 5e-5 (mM)		: Value from Amarillo et al., J Neurophysiol, 2014
}

STATE {
	cai		(mM) 
}

INITIAL {
	cai = cainf
}

ASSIGNED {
	ica		(mA/cm2)
	cai_rec		(mM)
}
	
BREAKPOINT {
	SOLVE state METHOD derivimplicit
	
}

DERIVATIVE state { 

	cai' = -(10000)*(ica*gamma/(2*FARADAY*depth)) - (cai - cainf)/taur
	cai_rec = cai

}







