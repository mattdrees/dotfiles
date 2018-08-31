# from https://gist.github.com/nicokruger/3415941

jstat -gccapacity $1  | \
  tail -n 1 | \
  
  awk '{ print $4, $5, $6, $10 }' | \
  python -c "import sys; nums = [x.split(' ') for x in sys.stdin.readlines()]; print(str(sum([float(x) for x in nums[0]]) / 1024.0) + ' mb');"
