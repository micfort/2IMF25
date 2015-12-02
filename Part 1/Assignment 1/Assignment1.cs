using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;

namespace Assignment._1._1
{
	class Program
	{
		static void Main(string[] args)
		{

			TextWriter output = Console.Out;
			//TextWriter output = new StreamWriter(@"C:\Users\michiel\Dropbox\School\2IMF25 - Automated Reasoning\2IMF25\Assignment1B.smt");

			output.WriteLine("(benchmark test.smt");
			output.WriteLine(":logic QF_UFLIA");
			output.WriteLine(":extrafuns ((N Int Int) (P Int Int) (S Int Int) (C Int Int) (D Int Int) (i Int))");
			output.WriteLine(":formula (and");
			output.WriteLine("(= (+ (P 1) (P 2) (P 3) (P 4) (P 5) (P 6)) 25) ");
			output.WriteLine("(= (+ (N 1) (N 2) (N 3) (N 4) (N 5) (N 6)) 4) ");
			output.WriteLine("(= (+ (S 1) (S 2) (S 3) (S 4) (S 5) (S 6)) 8) ");
			output.WriteLine("(= (+ (C 1) (C 2) (C 3) (C 4) (C 5) (C 6)) 10)");
			output.WriteLine("(= (+ (D 1) (D 2) (D 3) (D 4) (D 5) (D 6)) 5) ");
			for(int i = 1; i <= 6; i++)
			{
				output.WriteLine("(>= (P {0}) 0)", i);
				output.WriteLine("(>= (N {0}) 0)", i);
				output.WriteLine("(>= (S {0}) 0)", i);
				output.WriteLine("(>= (C {0}) 0)", i);
				output.WriteLine("(>= (D {0}) 0)", i);

				output.WriteLine("(<= (+ (* 700 (N {0})) (* 800 (P {0})) (* 1000 (S {0})) (* 1500 (C {0})) (* 100 (D {0}))) 7800)", i);
				output.WriteLine("(not (and (> (P {0}) 0) (> (C {0}) 0)))", i);
				output.WriteLine("(<= (D {0}) 2)", i);
			}

			for (int i = 3; i <= 6; i++)
			{
				output.WriteLine("(= (S {0}) 0)", i);
			}

			output.WriteLine("))");
			output.Close();
			//Console.ReadKey();
		}
	}
}
