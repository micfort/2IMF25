using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1._4
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

		public static void Advance(int i, int s, int min, int max)
		{
			output.WriteLine("	(or ");
			output.WriteLine ("		(= (A {2} {0}) (A {2} {1}))", s, s-1, i);
			output.WriteLine("	(and ");
			if (i == min) {
				output.WriteLine ("		(= (A {2} {0}) (A {3} {1}))", s, s-1, i, i+1);
				output.WriteLine ("		(= (A {2} {0}) (A {2} {1}))", s, s-1, i+1);
			} else {
				if (i == max) {
					output.WriteLine ("		(= (A {2} {0}) (A {3} {1}))", s, s-1, i, i-1);
					output.WriteLine ("		(= (A {2} {0}) (A {2} {1}))", s, s-1, i-1);
				} else {
					output.WriteLine ("		(= (A {2} {0}) (+ (A {3} {1}) (A {4} {1})))", s, s-1, i, i-1, i+1);
					output.WriteLine ("		(= (A {2} {0}) (A {2} {1}))", s, s-1, i-1);
					output.WriteLine ("		(= (A {2} {0}) (A {2} {1}))", s, s-1, i+1);
				}
			}
			output.WriteLine("	)");
			output.WriteLine("	)");
		}

		public static void Step(int s, int min, int max)
		{
			output.WriteLine("(and ");
			for (int i = min; i <= max; i++)
			{
				Advance(i,s,min,max);
			}
			output.WriteLine(")");
		}

		public static void Approve(int i, int j, int steps, int threshold)
		{
			output.WriteLine ("		(= (A {1} {0}) (A {2} {0}))", steps, i, j);
		}

		static void Main(string[] args)
		{
			output = Console.Out;
			output = new StreamWriter(@"Assignment4.smt");
			start("(A Int Int Int)", "QF_UFLIA");

			int min = 1;
			int max = 7;
			int threshold = 50;
			int steps = 5;

			for (int i = min; i <= max; i++)
			{
				output.WriteLine("(= (A {0} 0) {0})", i);
			}

			for (int s = 1; s <= steps; s++)
			{
				Step(s, min, max);
			}

			output.WriteLine("(or ");
			for (int i = min; i <= max-1; i++) {
				for (int j = i+1; j <= max; j++) {
					output.WriteLine("	(and ");
					Approve (i, j, steps, threshold);
					output.WriteLine ("		(>= (A {1} {0}) {2})", steps, i, threshold);
					output.WriteLine ("		(>= (A {1} {0}) {2})", steps, j, threshold);
					output.WriteLine("	)");
				}
			}
			output.WriteLine(")");

			end();

			output.Close();
			//Console.ReadKey();
		}
	}
}
