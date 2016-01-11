using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics;

namespace Assignment2._4
{
	class Program
	{
		const string S1 = "S1";
		const string S2 = "S2";
		const string S3 = "S3";
		const string S4 = "S4";
		const string SL = "SL";
		const string S = "S";
		const string A = "A";
		const string T = "T";
		const string Trans = "Trans";
		static int[] ATime = { 0, 1, 2, 5, 10, 20 };
		const int MaxTime = 97;
		const int MaxSteps = 12;


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
		public static string not(params string[] attributes)
		{
			return operation("not", attributes);
		}
		public static string equals(string first, string second)
		{
			return operation("=", first, second);
		}

		public static string array(string arrayName, params string[] index)
		{
			return string.Format("({0} {1})", arrayName, string.Join(" ", index));
		}
		public static string array(string arrayName, params int[] index)
		{
			return array(arrayName, new List<int>(index).ConvertAll<string>(i => i.ToString()).ToArray());
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

		public static string ForJoin(int start, int end, Func<int, string> f)
		{
			StringBuilder sb = new StringBuilder();
			for(int i = start; i < end; i++)
			{
				if (i != start)
					sb.Append(" ");
				sb.Append(f(i));
			}
			return sb.ToString();
		}

		public static string PlusForJoin(int start, int end, Func<int, string> f)
		{
			string s = f(start);
			for (int i = start+1; i < end; i++)
			{
				s = plus(s, f(i));
			}
			return s;
		}

		public static void start(string funs, string preds, string logic)
		{
			write("(benchmark test.smt");
			write(":logic {0}", logic);
			if(!string.IsNullOrWhiteSpace(funs)) write(":extrafuns ({0})", funs);
			if (!string.IsNullOrWhiteSpace(preds)) write(":extrapreds ({0})", preds);
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

		public static void Requirements(int timestep)
		{
			write(lessEqual(PlusForJoin(1, ATime.Length, i => array(Trans, i, timestep)), "2"));
			for (int i = 1; i <= ATime.Length - 1; i++)
			{
				write(GreaterEqual(array(Trans, i, timestep), "0"));
			}
		}

		public static string NotInCross(int t, int a1)
		{
			return NotInCross(t, a1, -1);
        }

		public static string NotInCross(int t, int a1, int a2)
		{
			StringBuilder sb = new StringBuilder();
			for (int i = 1; i <= ATime.Length - 1; i++)
			{
				if(i != a1 && i != a2)
					sb.Append(equals(array(S, i, t), array(S, i, t+1)));
			}
			return sb.ToString();
		}

		public static void CrossDouble(int t, int a1, int a2)
		{
			write(
				and(
					array(SL, t), array(S, a1, t), array(S, a2, t),
					not(array(SL, t+1)), not(array(S, a1, t+1)), not(array(S, a2, t+1)),
					NotInCross(t, a1, a2),
                    equals(array(Trans, a1, t), "1"), equals(array(Trans, a2, t), "1"),
					equals(array(T, t+1), plus(array(T, t), Math.Max(ATime[a1], ATime[a2]).ToString()))
				)
			);

			write(
				and(
					not(array(SL, t)), not(array(S, a1, t)), not(array(S, a2, t)),
					array(SL, t+1), array(S, a1, t+1), array(S, a2, t+1),
					NotInCross(t, a1, a2),
					equals(array(Trans, a1, t), "1"), equals(array(Trans, a2, t), "1"),
					equals(array(T, t + 1), plus(array(T, t), Math.Max(ATime[a1], ATime[a2]).ToString()))
				)
			);
		}

		public static void CrossSingle(int t, int a)
		{
			write(
				and(
					array(SL, t), array(S, a, t),
					not(array(SL, t + 1)), not(array(S, a, t + 1)),
					NotInCross(t, a),
					equals(array(Trans, a, t), "2"),
					equals(array(T, t + 1), plus(array(T, t), ATime[a].ToString()))
				)
			);

			write(
				and(
					not(array(SL, t)), not(array(S, a, t)),
					array(SL, t + 1), array(S, a, t + 1),
					NotInCross(t, a),
					equals(array(Trans, a, t), "2"),
					equals(array(T, t + 1), plus(array(T, t), ATime[a].ToString()))
				)
			);
		}

		public static void Solution(int t)
		{
			write(
				and(
					ForJoin(1, ATime.Length, i => not(array(S, i, t))),
					lessEqual(array(T, t), MaxTime.ToString())
				)
			);
		}

		static void outputModel(int timesteps)
		{
			start("(T Int Int) (A Int Int) (Trans Int Int Int) ", "(S Int Int) (SL Int)", "QF_UFLIA");

			write(equals(array(T, 0), "0"));

			for (int i = 1; i <= ATime.Length - 1; i++)
			{
				write(equals(array(A, i), ATime[i].ToString()));
				write(array(S, i, 0));
			}
			write(array(SL, 0));

			for (int i = 0; i < timesteps; i++)
			{
				Requirements(i);
			}

			for (int i = 0; i < timesteps; i++)
			{
				write("(or ");
				for (int a1 = 1; a1 <= ATime.Length - 1; a1++)
					for (int a2 = 1; a2 < a1; a2++)
						CrossDouble(i, a1, a2);
				for (int a = 1; a <= ATime.Length - 1; a++)
					CrossSingle(i, a);
				write(")");
			}

			write("(or ");
			for(int i = 0; i <= timesteps; i++)
			{
				Solution(i);
            }
			write(")");

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
			start.RedirectStandardError = true;
			start.UseShellExecute = false;
			start.CreateNoWindow = true;

			proc = Process.Start(start);

			output = proc.StandardInput;
		}

		static bool unsat(int timesteps)
		{
			startProcess(false);

			outputModel(timesteps);

			output.Close();

			proc.WaitForExit();

			string error = proc.StandardError.ReadToEnd();
			if (!string.IsNullOrEmpty(error))
				throw new Exception(error);
			string result = proc.StandardOutput.ReadToEnd();
			if (result.Contains("unsat"))
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		static void ShowResult(int timesteps)
		{
			startProcess(true);

			outputModel(timesteps);

			output.Close();

			proc.WaitForExit();

			string result = proc.StandardOutput.ReadToEnd();
			Console.WriteLine(result);
		}

		static void Main(string[] args)
		{
			List<int> times = new List<int>();
			times.Add(0);
            for (int i = 0; i < 7; i++)
			{
				times.Add(Convert.ToInt32(Math.Round(Math.Pow(2, i))));
			}
			ATime = times.ToArray();

			int timesteps = 1;

			do
			{
				timesteps++;
				Console.WriteLine("timesteps: {0}", timesteps);
			}
			while (timesteps < MaxSteps && unsat(timesteps));
			/*{
				
				Console.WriteLine("timesteps: {0}", timesteps);
			}*/

			if (timesteps == MaxSteps)
			{
				Console.WriteLine("no sat in {0} timesteps", MaxSteps);
				Console.ReadKey();
			}
			else
			{
				ShowResult(timesteps);
				Console.WriteLine("timesteps needed for sat: {0}", timesteps);
				Console.ReadKey();
			}
		}
	}
}
