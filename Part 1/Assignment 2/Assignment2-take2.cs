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
			start("P Int Int Int", "QF_UFLIA");

			int[] chip = new int[2] {29,22};
			int[] powerComponent = new int[2] {4,2};
			int[,] components = new int[8, 2] {{9,7},{12,6},{10,7},{18,5},{20,4},{10,6},{8,6},{10,8}};
			int powerDist = 17;

			//All components must occur
			for (int i = 2; i < components.Length + 2; i++) {
				output.WriteLine("(or");
				for (int x = 0; x < chip [0]; x++) {
					for (int y = 0; y < chip [1]; y++) {
						output.WriteLine("(= (P {0} {1}) {2})", x, y, i);
					}
				}
				output.WriteLine(")");
			}

			end();

			output.Close();
			//Console.ReadKey();
		}
	}
}
