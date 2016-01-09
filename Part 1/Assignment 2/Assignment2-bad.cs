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
			start("(CX Int Int) (CY Int Int) (CD Int Int) (PX Int Int) (PY Int Int) (PD Int Int)", "QF_UFLIA");

			int[] chip = new int[2] {29,22};
			int[] powerComponent = new int[2] {4,2};
			int[,] components = new int[8, 2] {{9,7},{12,6},{10,7},{18,5},{20,4},{10,6},{8,6},{10,8}};
			int powerDist = 17;
			//At most this many power components fit on the chip
			int numPower = (1 + (chip [0] / powerDist)) * (1+(chip [1] / powerDist));


			//Place the power components 
			for (int i = 0; i < numPower; i++) {
				output.WriteLine("(or");
				for (int d = 0; d < 2; d++) {
					output.WriteLine("	(and");
					output.WriteLine("		(= (PD {0}) {1})", i, d);
					for (int j = 0; j < numPower; j++) {
						if (i != j){
							output.WriteLine("		(or");
							for (int e = 0; e < 2; e++) {
								output.WriteLine("			(and");
								output.WriteLine("				(= (PD {0}) {1})", j, e);
								output.WriteLine("				(or");
								//Centers at least required distance apart
								output.WriteLine("					(>= (PX {0}) (+ (PX {1}) {2}))", j, i, powerDist + powerComponent[d]/2 - powerComponent[e]/2);
								output.WriteLine("					(>= (PY {0}) (+ (PY {1}) {2}))", j, i, powerDist + powerComponent[(d+1)%2]/2 - powerComponent[(e+1)%2]/2);
								output.WriteLine("					(<= (PX {0}) (- (PX {1}) {2}))", j, i, powerDist - powerComponent[d]/2 + powerComponent[e]/2);
								output.WriteLine("					(<= (PY {0}) (- (PY {1}) {2}))", j, i, powerDist + powerComponent[(d+1)%2]/2 - powerComponent[(e+1)%2]/2);
								output.WriteLine("				)");
								output.WriteLine("			)");
							}
							output.WriteLine("		)");
						}
					}
					for (int j = 0; j < components.Length/2; j++) {
						if (i != j) {
							output.WriteLine ("		(or");
							for (int e = 0; e < 2; e++) {
								output.WriteLine ("			(and");
								output.WriteLine ("				(= (CD {0}) {1})", j, e);
								output.WriteLine ("				(or");
								output.WriteLine ("					(>= (CX {0}) (+ (PX {1}) {2}))", j, i, powerComponent [d]);
								output.WriteLine ("					(>= (CY {0}) (+ (PY {1}) {2}))", j, i, powerComponent [(d + 1) % 2]);
								output.WriteLine ("					(<= (CX {0}) (- (PX {1}) {2}))", j, i, components [j, e]);
								output.WriteLine ("					(<= (CY {0}) (- (PY {1}) {2}))", j, i, components [j, (e + 1) % 2]);
								output.WriteLine ("				)");
								output.WriteLine ("			)");
							}
							output.WriteLine ("		)");
						}
					}
					//Cannot exceed chip
					output.WriteLine("		(< (+ (PX {0}) {1}) {2})", i, powerComponent[d], chip[0]);
					output.WriteLine("		(< (+ (PY {0}) {1}) {2})", i, powerComponent[(d+1)%2], chip[1]);
					output.WriteLine("	)");
				}
				//Optionally remove component i from the chip
				output.WriteLine("	(= (PX {0}) {1})", i, chip[0] + powerDist * 2);
				output.WriteLine(")");
				output.WriteLine("(>= (PX {0}) 0)", i);
				output.WriteLine("(>= (PY {0}) 0)", i);
			}

			//Place the other components 
			for (int i = 0; i < components.Length/2; i++) {
				output.WriteLine("(or");
				for (int d = 0; d < 2; d++) {
					output.WriteLine("	(and");
					output.WriteLine("		(= (CD {0}) {1})", i, d);
					output.WriteLine("		(or");
					for (int j = 0; j < numPower; j++) {
						//Must have adjacent power supply
						for (int e = 0; e < 2; e++) {
							output.WriteLine("			(and");
							output.WriteLine("				(= (PD {0}) {1})", j, e);
							output.WriteLine("				(or");
							//Component lies correctly on one side
							output.WriteLine("					(and");
							//Power lies behind component
							output.WriteLine("						(= (PX {0}) (+ (CX {1}) {2}))", j, i, components[i,d]);
							output.WriteLine("						(> (PY {0}) (- (CY {1}) {2}))", j, i, powerComponent[(e+1)%2]);
							output.WriteLine("						(< (PY {0}) (+ (CY {1}) {2}))", j, i, components[i,(d+1)%2]);
							output.WriteLine("					)");
							output.WriteLine("					(and");
							//Power lies below component
							output.WriteLine("						(= (PY {0}) (+ (CY {1}) {2}))", j, i, components[i,(d+1)%2]);
							output.WriteLine("						(> (PX {0}) (- (CX {1}) {2}))", j, i, powerComponent[e]);
							output.WriteLine("						(< (PX {0}) (+ (CX {1}) {2}))", j, i, components[i,d]);
							output.WriteLine("					)");
							output.WriteLine("					(and");
							//Power lies before component
							output.WriteLine("						(= (PX {0}) (- (CX {1}) {2}))", j, i, powerComponent[e]);
							output.WriteLine("						(> (PY {0}) (- (CY {1}) {2}))", j, i, powerComponent[(e+1)%2]);
							output.WriteLine("						(< (PY {0}) (+ (CY {1}) {2}))", j, i, components[i,(d+1)%2]);
							output.WriteLine("					)");
							output.WriteLine("					(and");
							//Power lies above component
							output.WriteLine("						(= (PY {0}) (- (CY {1}) {2}))", j, i, powerComponent[(e+1)%2]);
							output.WriteLine("						(> (PX {0}) (- (CX {1}) {2}))", j, i, powerComponent[e]);
							output.WriteLine("						(< (PX {0}) (+ (CX {1}) {2}))", j, i, components[i,d]);
							output.WriteLine("					)");
							output.WriteLine("				)");
							output.WriteLine("			)");
						}
					}
					output.WriteLine("		)");
					for (int j = 0; j < components.Length/2; j++) {
						if (i != j) {
							output.WriteLine ("		(or");
							for (int e = 0; e < 2; e++) {
								output.WriteLine ("			(and");
								output.WriteLine ("				(= (CD {0}) {1})", j, e);
								output.WriteLine ("				(or");
								output.WriteLine ("					(>= (CX {0}) (+ (CX {1}) {2}))", j, i, components [i, d]);
								output.WriteLine ("					(>= (CY {0}) (+ (CY {1}) {2}))", j, i, components [i, (d + 1) % 2]);
								output.WriteLine ("					(<= (CX {0}) (- (CX {1}) {2}))", j, i, components [j, e]);
								output.WriteLine ("					(<= (CY {0}) (- (CY {1}) {2}))", j, i, components [j, (e + 1) % 2]);
								output.WriteLine ("				)");
								output.WriteLine ("			)");
							}
							output.WriteLine ("		)");
						}
					}
					for (int j = 0; j < numPower; j++) {
						output.WriteLine ("		(or");
						for (int e = 0; e < 2; e++) {
							output.WriteLine ("			(and");
							output.WriteLine("				(= (PD {0}) {1})", j, e);
							output.WriteLine ("				(or");
							output.WriteLine ("					(>= (PX {0}) (+ (CX {1}) {2}))", j, i, components [i,d]);
							output.WriteLine ("					(>= (PY {0}) (+ (CY {1}) {2}))", j, i, components [i,(d + 1) % 2]);
							output.WriteLine ("					(<= (PX {0}) (- (CX {1}) {2}))", j, i, powerComponent [e]);
							output.WriteLine ("					(<= (PY {0}) (- (CY {1}) {2}))", j, i, powerComponent [(e + 1) % 2]);
							output.WriteLine ("				)");
							output.WriteLine ("			)");
						}
						output.WriteLine ("		)");
					}
					//Cannot exceed chip
					output.WriteLine("		(< (+ (CX {0}) {1}) {2})", i, components[i,d], chip[0]);
					output.WriteLine("		(< (+ (CY {0}) {1}) {2})", i, components[i,(d+1)%2], chip[1]);
					output.WriteLine("	)");
				}
				output.WriteLine(")");
				output.WriteLine("(>= (CX {0}) 0)", i);
				output.WriteLine("(>= (CY {0}) 0)", i);
			}

			end();

			output.Close();
			//Console.ReadKey();
		}
	}
}
