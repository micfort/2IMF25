using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Assignment1._3
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

		public static void Precedence(int pre, int post)
		{
			output.WriteLine("(>= (S {0}) (+ (S {1}) {1}))", post, pre);
		}

		public static void NotBetween(int point, int J2)
		{
			output.WriteLine("(not ");
			output.WriteLine("	(and ");
			output.WriteLine("		(>= (S {0}) (S {1}))", point, J2);
			output.WriteLine("		(< (S {0}) (+ (S {1}) {1}))", point, J2);
			output.WriteLine("	)");
			output.WriteLine(")");

			output.WriteLine("(not ");
			output.WriteLine("	(and ");
			output.WriteLine("		(> (+ (S {0}) {0}) (S {1}))", point, J2);
			output.WriteLine("		(<= (+ (S {0}) {0}) (+ (S {1}) {1}))", point, J2);
			output.WriteLine("	)");
			output.WriteLine(")");
		}

		public static void DoNotOverlap(int J1, int J2)
		{
			NotBetween(J1, J2);
			NotBetween(J2, J1);
		}

		static void Main(string[] args)
		{
			output = Console.Out;
			output = new StreamWriter(@"C:\Users\michiel\Dropbox\School\2IMF25 - Automated Reasoning\2IMF25\Assignment3.smt");
			start("(S Int Int) (E Int Int) (MAX Int)", "QF_UFLIA");

			output.WriteLine("(<= MAX 37)");

			for (int i = 1; i <= 12; i++)
			{
				output.WriteLine("(<= (+ (S {0}) {0}) MAX)", i);
				output.WriteLine("(>= (S {0}) 0)", i);
				output.WriteLine("(= (E {0}) (+ (S {0}) {0}))", i);
			}

			Precedence(1, 3);
			Precedence(2, 3);
			Precedence(3, 5);
			Precedence(4, 5);
			Precedence(3, 7);
			Precedence(4, 7);
			Precedence(6, 7);
			Precedence(5, 9);
			Precedence(8, 9);
			Precedence(10, 11);
			Precedence(9, 12);
			Precedence(11, 12);

			DoNotOverlap(5, 7);
			DoNotOverlap(7, 10);
			DoNotOverlap(5, 10);

			end();

			output.Close();
			//Console.ReadKey();
        }
	}
}
