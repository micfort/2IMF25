using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1._2
{
	class Program
	{
		static TextWriter output;

		public static void start(string funs, string logic)
		{
			output.WriteLine("(benchmark test.smt");
			output.WriteLine(":logic {0}", logic);
			output.WriteLine(":extrafuns ({0})", funs);
			output.WriteLine(":formula (and");
		}

		public static void end()
		{
			output.WriteLine("))");
		}

		static void Main(string[] args)
		{
			output = Console.Out;
			output = new StreamWriter(@"Assignment2.smt");
			start("(SW Int) (SH Int) (PD Int) (CX Int Int) (CY Int Int) (CW Int Int) (CH Int Int) (PX Int Int) (PY Int Int) (PW Int Int) (PH Int Int)", "QF_UFLIA");

			int[] chip = new int[2] {29,22};
			int[] powerComponent = new int[2] {4,2};
			int[,] components = new int[8, 2] {{9,7},{12,6},{10,7},{18,5},{20,4},{10,6},{8,6},{10,8}};
			int powerDist = 17;
			//At most this many power components fit on the chip
			int numPower = 3;

			output.WriteLine("(= SW {0})", chip[0]);
			output.WriteLine("(= SH {0})", chip[1]);
			output.WriteLine("(= PD {0})", powerDist);
			//Place the power components 
			for (int i = 0; i < numPower; i++) {
				for (int j = i+1; j < numPower; j++) {
					output.WriteLine("(or");
					//Centers at least required distance apart
					output.WriteLine("	(>= (+ (PX {0}) (/ (PW {0}) 2)) (+ (+ (PX {1}) (/ (PW {1}) 2)) PD))", j, i);
					output.WriteLine("	(>= (+ (PY {0}) (/ (PH {0}) 2)) (+ (+ (PY {1}) (/ (PH {1}) 2)) PD))", j, i);
					output.WriteLine("	(<= (+ (PX {0}) (/ (PW {0}) 2)) (- (+ (PX {1}) (/ (PW {1}) 2)) PD))", j, i);
					output.WriteLine("	(<= (+ (PY {0}) (/ (PH {0}) 2)) (- (+ (PY {1}) (/ (PH {1}) 2)) PD))", j, i);
					output.WriteLine(")");
				}
				//Cannot exceed chip
				output.WriteLine("(<= (+ (PX {0}) (PW {0})) SW)", i);
				output.WriteLine("(<= (+ (PY {0}) (PH {0})) SH)", i);
				output.WriteLine("(>= (PX {0}) 0)", i);
				output.WriteLine("(>= (PY {0}) 0)", i);
				//Pick version
				output.WriteLine("(or");
				output.WriteLine("	(and");
				output.WriteLine("		(= (PW {0}) {1})", i, powerComponent[0]);
				output.WriteLine("		(= (PH {0}) {1})", i, powerComponent[1]);
				output.WriteLine("	)");
				output.WriteLine("	(and");
				output.WriteLine("		(= (PW {0}) {1})", i, powerComponent[1]);
				output.WriteLine("		(= (PH {0}) {1})", i, powerComponent[0]);
				output.WriteLine("	)");
				output.WriteLine(")");
			}

			//Place the other components 
			for (int i = 0; i < components.Length/2; i++) {
				output.WriteLine("(or");
				for (int j = 0; j < numPower; j++) {
					//Must have adjacent power supply
					output.WriteLine("	(or");
					//Component lies correctly on one side
					output.WriteLine("		(and");
					//Power lies behind component
					output.WriteLine("			(= (PX {0}) (+ (CX {1}) (CW {1})))", j, i);
					output.WriteLine("			(> (PY {0}) (- (CY {1}) (PH {0})))", j, i);
					output.WriteLine("			(< (PY {0}) (+ (CY {1}) (CH {1})))", j, i);
					output.WriteLine("		)");
					output.WriteLine("		(and");
					//Power lies below component
					output.WriteLine("			(= (PY {0}) (+ (CY {1}) (CH {1})))", j, i);
					output.WriteLine("			(> (PX {0}) (- (CX {1}) (PW {0})))", j, i);
					output.WriteLine("			(< (PX {0}) (+ (CX {1}) (CW {1})))", j, i);
					output.WriteLine("		)");
					output.WriteLine("		(and");
					//Power lies before component
					output.WriteLine("			(= (PX {0}) (- (CX {1}) (PW {0})))", j, i);
					output.WriteLine("			(> (PY {0}) (- (CY {1}) (PH {0})))", j, i);
					output.WriteLine("			(< (PY {0}) (+ (CY {1}) (CH {1})))", j, i);
					output.WriteLine("		)");
					output.WriteLine("		(and");
					//Power lies above component
					output.WriteLine("			(= (PY {0}) (- (CY {1}) (PH {0})))", j, i);
					output.WriteLine("			(> (PX {0}) (- (CX {1}) (PW {0})))", j, i);
					output.WriteLine("			(< (PX {0}) (+ (CX {1}) (CW {1})))", j, i);
					output.WriteLine("		)");
					output.WriteLine("	)");
				}
				//Not overlapping with any components
				output.WriteLine(")");
				for (int j = i+1; j < components.Length/2; j++) {
					output.WriteLine ("(or");
					output.WriteLine ("	(>= (CX {0}) (+ (CX {1}) (CW {1})))", j, i);
					output.WriteLine ("	(>= (CY {0}) (+ (CY {1}) (CH {1})))", j, i);
					output.WriteLine ("	(<= (CX {0}) (- (CX {1}) (CW {0})))", j, i);
					output.WriteLine ("	(<= (CY {0}) (- (CY {1}) (CH {0})))", j, i);
					output.WriteLine (")");
				}
				for (int j = 0; j < numPower; j++) {
					output.WriteLine ("(or");
					output.WriteLine ("	(>= (PX {0}) (+ (CX {1}) (CW {1})))", j, i);
					output.WriteLine ("	(>= (PY {0}) (+ (CY {1}) (CH {1})))", j, i);
					output.WriteLine ("	(<= (PX {0}) (- (CX {1}) (PW {0})))", j, i);
					output.WriteLine ("	(<= (PY {0}) (- (CY {1}) (PH {0})))", j, i);
					output.WriteLine (")");
				}
				//Cannot exceed chip
				output.WriteLine("(<= (+ (CX {0}) (CW {0})) SW)", i);
				output.WriteLine("(<= (+ (CY {0}) (CH {0})) SH)", i);
				output.WriteLine("(>= (CX {0}) 0)", i);
				output.WriteLine("(>= (CY {0}) 0)", i);
				//Pick version
				output.WriteLine("(or");
				output.WriteLine("	(and");
				output.WriteLine("		(= (CW {0}) {1})", i, components[i,0]);
				output.WriteLine("		(= (CH {0}) {1})", i, components[i,1]);
				output.WriteLine("	)");
				output.WriteLine("	(and");
				output.WriteLine("		(= (CW {0}) {1})", i, components[i,1]);
				output.WriteLine("		(= (CH {0}) {1})", i, components[i,0]);
				output.WriteLine("	)");
				output.WriteLine(")");
			}

			end();

			output.Close();
			//Console.ReadKey();
		}
	}
}
