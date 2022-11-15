# Enigmatic

# Evaluation Rubric:

1. Functionality
  I believe that I have met the requirements for a 4 in functionality. My cracking method is working, I have eliminated edge cases, and the command line interface works as intended.

2. OOP
  I am somewhere between a 3 and a 4 for this criteria. My shift and cracking methods are modules, originally the cracker was a subclass of Enigma, but the interaction pattern requires that it be integrated into Enigma, so I transitioned it to a module following a closer reading of the spec. I had wanted to move my rotation class into a module as well, but the implementation became messy and I was forced to leave it as its own class. I don't think that is necessarily the worst thing, as if I wanted to scale this, keeping rotation as its own class, and storing instances of the rotation based on the shift input would allow for a database that could be called if that shift is encountered in the future.

3. Ruby Conventions/Mechanics
  This is probably my weakest section and comes in right at a 3. The method I use for encryption is about 10 lines, and uses chained conditionals, I attempted to refactor, but having two arguments would be necessary and I don't see a way to pull that functionality out. My crack module is also bloated and features numerous chained conditionals and is absolutely not DRY. It was the last thing I worked on and I did not have time to go through and refactor all the various parts into single methods.

4. TDD
  My testing is solid and for the first 3 iterations I have 100% coverage with testing of edge cases. The crack module is at 99% coverage due to a couple of pieces of code that I am not sure are 100% necessary, but that I left in to account for possible edge cases, see lines 177-182 of the crack module. I only implemented one stub in my shift_spec to test for a key generated when one isn't given, otherwise I did not find any particular need for them. I am interested to hear how my use of #to be_between("00000", "99999").inclusive at lines 11-16 of my shift spec are viewed, I thought it was a clever way to cover random key generation.

5. Version Control
  I pushed 46 commits in 16 pull requests, and had one additional PR that I ended up reverting because it broke some of the functionality after I tested it with the CLI stuff. I probably could have split some of the commits into smaller bits, as I have the habit of getting on a roll and forgetting to commit. As such this is probably somewhere in the 3-4 range as well.