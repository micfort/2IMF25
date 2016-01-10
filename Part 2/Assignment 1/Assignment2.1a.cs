using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Assignment2._1a
{
	class Program
	{
		const string S = "1";
		const string A = "2";
		const string B = "3";
		const string C = "4";

		const string TLoad = "TLoad";
		const string TMaxLoad = "300";
		const string TLoc = "TLoc";
		const string AStock = "AStock";
		const string AMaxStock = "120";
		const string BStock = "BStock";
		const string BMaxStock = "120";
		const string CStock = "CStock";
		const string CMaxStock = "200";
		const string U = "U";

		const string SA = "29";
		const string SB = "21";
		const string AB = "17";
		const string AC = "32";
		const string BC = "37";

		static TextWriter output;
		static Process proc;

		public static string operation(string operation, params string[] attributes)
        {
			return string.Format("({1} {0})", string.Join(" ", attributes), operation);
		}

		public static string and(params string[] attributes)
		{
			return operation("and", attributes);
        }
		public static string or(params string[] attributes)
		{
			return operation("or", attributes);
		}
		public static string equals(string first, string second)
		{
			return operation("=", first, second);
		}

		public static string array(string arrayName, string index)
		{
			return string.Format("({0} {1})", arrayName, index);
		}
		public static string array(string arrayName, int index)
		{
			return array(arrayName, index.ToString());
		}

		public static string min(string first, string second)
		{
			return operation("-", first, second);
		}

		public static string plus(string first, string second)
		{
			return operation("+", first, second);
		}

		public static string less(string first, string second)
		{
			return operation("<", first, second);
		}

		public static string lessEqual(string first, string second)
		{
			return operation("<=", first, second);
		}

		public static string GreaterEqual(string first, string second)
		{
			return operation(">=", first, second);
		}

		public static void start(string funs, string logic)
		{
			write("(benchmark test.smt");
			write(":logic {0}", logic);
			write(":extrafuns ({0})", funs);
			write(":formula (and");
		}

		public static void end()
		{
			write("))");
			write("");
		}

		public static void write(string s, params object[] p)
		{
			output.WriteLine(s, p);
			//Console.WriteLine(s, p);
        }



		public static void Transitions(int t)
		{
			write(
				or(
					and(
						equals(array(TLoc, t), S), 
						equals(array(TLoad, t+1), TMaxLoad),
						or(
							and(
								equals(array(TLoc, t + 1), A),
								equals(array(AStock, t + 1), min(array(AStock, t), SA)),
								equals(array(BStock, t + 1), min(array(BStock, t), SA)),
								equals(array(CStock, t + 1), min(array(CStock, t), SA))
							),
							and(
								equals(array(TLoc, t + 1), B),
								equals(array(AStock, t + 1), min(array(AStock, t), SB)),
								equals(array(BStock, t + 1), min(array(BStock, t), SB)),
								equals(array(CStock, t + 1), min(array(CStock, t), SB))
							)
						)
					),
					and(
						equals(array(TLoc, t), A),
						equals(array(TLoad, t + 1), min(array(TLoad, t), array(U, t))),
						lessEqual("0", array(U, t)), lessEqual(array(U, t), array(TLoad, t)),
						less(plus(array(U, t), array(AStock, t)), AMaxStock),
						or(
							and(
								equals(array(TLoc, t + 1), S),
								equals(array(AStock, t + 1), plus(min(array(AStock, t), SA), array(U, t))),
								equals(array(BStock, t + 1), min(array(BStock, t), SA)),
								equals(array(CStock, t + 1), min(array(CStock, t), SA))
							),
							and(
								equals(array(TLoc, t + 1), B),
								equals(array(AStock, t + 1), plus(min(array(AStock, t), AB), array(U, t))),
								equals(array(BStock, t + 1), min(array(BStock, t), AB)),
								equals(array(CStock, t + 1), min(array(CStock, t), AB))
							),
							and(
								equals(array(TLoc, t + 1), C),
								equals(array(AStock, t + 1), plus(min(array(AStock, t), AC), array(U, t))),
								equals(array(BStock, t + 1), min(array(BStock, t), AC)),
								equals(array(CStock, t + 1), min(array(CStock, t), AC))
							)
						)
					),
					and(
						equals(array(TLoc, t), B),
						equals(array(TLoad, t + 1), min(array(TLoad, t), array(U, t))),
						lessEqual("0", array(U, t)), lessEqual(array(U, t), array(TLoad, t)),
						less(plus(array(U, t), array(BStock, t)), BMaxStock),
						or(
							and(
								equals(array(TLoc, t + 1), S),
								equals(array(AStock, t + 1), min(array(AStock, t), SB)),
								equals(array(BStock, t + 1), plus(min(array(BStock, t), SB), array(U, t))),
								equals(array(CStock, t + 1), min(array(CStock, t), SB))
							),
							and(
								equals(array(TLoc, t + 1), A),
								equals(array(AStock, t + 1), min(array(AStock, t), AB)),
								equals(array(BStock, t + 1), plus(min(array(BStock, t), AB), array(U, t))),
								equals(array(CStock, t + 1), min(array(CStock, t), AB))
							),
							and(
								equals(array(TLoc, t + 1), C),
								equals(array(AStock, t + 1), min(array(AStock, t), BC)),
								equals(array(BStock, t + 1), plus(min(array(BStock, t), BC), array(U, t))),
								equals(array(CStock, t + 1), min(array(CStock, t), BC))
							)
						)
					),
					and(
						equals(array(TLoc, t), C),
						equals(array(TLoad, t + 1), min(array(TLoad, t), array(U, t))),
						lessEqual("0", array(U, t)), lessEqual(array(U, t), array(TLoad, t)),
						less(plus(array(U, t), array(CStock, t)), CMaxStock),
						or(
							and(
								equals(array(TLoc, t + 1), A),
								equals(array(AStock, t + 1), min(array(AStock, t), AC)),
								equals(array(BStock, t + 1), min(array(BStock, t), AC)),
								equals(array(CStock, t + 1), plus(min(array(CStock, t), AC), array(U, t)))
							),
							and(
								equals(array(TLoc, t + 1), B),
								equals(array(AStock, t + 1), min(array(AStock, t), BC)),
								equals(array(BStock, t + 1), min(array(BStock, t), BC)),
								equals(array(CStock, t + 1), plus(min(array(CStock, t), BC), array(U, t)))
							)
						)
					)
				)
			);
		}

		static void Requirements(int t)
		{
			write(GreaterEqual(array(AStock, t), "0"));
			write(GreaterEqual(array(BStock, t), "0"));
			write(GreaterEqual(array(CStock, t), "0"));
		}

		static void outputModel(int timesteps)
		{
			start("(TLoad Int Int) (TLoc Int Int) (AStock Int Int) (BStock Int Int) (CStock Int Int) (U Int Int)", "QF_UFLIA");

			write(equals(array(TLoc, 0), S));
			write(equals(array(AStock, 0), "40"));
			write(equals(array(BStock, 0), "30"));
			write(equals(array(CStock, 0), "145"));

			for (int i = 0; i < timesteps; i++)
			{
				Requirements(i);
				Transitions(i);
			}
			Requirements(timesteps);

			end();
		}

		static void startProcess(bool model)
		{
			// Prepare the process to run
			ProcessStartInfo start = new ProcessStartInfo();
			// Enter in the command line arguments, everything you would enter after the executable name itself
			if (model)
			{
				start.Arguments = "-m ";
			}
			// Enter the executable to run, including the complete path
			start.FileName = @"C:\Users\michiel\Dropbox\School\2IMF25 - Automated Reasoning\yices-2.4.1\bin\yices-smt.exe";
			// Do you want to show a console window?
			start.WindowStyle = ProcessWindowStyle.Hidden;
			start.RedirectStandardInput = true;
			start.RedirectStandardOutput = true;
			start.UseShellExecute = false;
			start.CreateNoWindow = true;
			int exitCode;

			proc = Process.Start(start);

			output = proc.StandardInput;
		}

		static bool succesful(int timesteps)
		{
			startProcess(false);

			outputModel(timesteps);

			output.Close();

			proc.WaitForExit();

			string result = proc.StandardOutput.ReadToEnd();
			if (result.Contains("unsat"))
			{
				return false;
			}
			else
			{
				return true;	
			}
        }


		static void Main(string[] args)
		{
			int timesteps = 1;
			Console.WriteLine("timesteps: {0}", timesteps);
			while (succesful(timesteps) && timesteps < 100)
			{
				timesteps++;
				Console.WriteLine("timesteps: {0}", timesteps);
			}

			if(timesteps == 100)
			{
				Console.WriteLine("no unsat in 100 timesteps");
				Console.ReadKey();
			}
			else 
			{
				Console.WriteLine("timesteps needed for unsat: {0}", timesteps);
				Console.ReadKey();
			}
			
		}
	}
}
