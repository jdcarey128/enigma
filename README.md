## enigma self evaluation

1. Functionality: 3.5
- This project is above the meets expectations threshold because it does successfully implement the encrypt/decrypt methods with CLI, and it attempts to implement the cracking method with CLI. Currently, the cracking method is successful when the 'A shift key' is below a 26. This is because the current code is not able to adjust the A shift key if the subsequent keys do not 'fit' together with the required two digits each. Additional work needs to be done to account for A shift key adjustment in cases where the value is 26 or greater.

1. OOP: 3.5
- This project encapsulates classes in a logical manner with each containing a specific function. The 'Listable' module helps to DRY out the code shared between several classes. However, more robust modules could be implemented to further DRY the code. The classes are as follows:  
  *KeyGenerator: Splits provided key into A, B, C, and D shift keys. It will randomly generate a 5-digit key if one is not provided.*  
  *OffsetGenerator: Splits provided date (or 'Today's date') into A, B, C, and D shift offsets.*  
  *Shift: Combine shift keys and offsets and encrypts/decrypts message based on those shifts.*  
  *Messenger: Interacts with txt files (though could use some refactoring to instantiate with file location).*  
  *CrackKey: Produces cracked key given message and date (or Today's date).*  
  *Enigma: Calls Messenger, Shift, and CrackKey classes to encrypt/decrypt/crack message.*  

1. Ruby Conventions and Mechanics: 3
- This project follows proper ruby conventions and syntax, utilizes several different enumerables (though maybe not the most efficient) and data structures, and is readable. There are several methods that are 10 lines and one that is longer than 10 lines.

1. TDD: 4
- This project utilizes mocks and stubs multiple times in testing (for date and key generation and has 100% coverage for non-test files.

1. Version Control: 3.5
- This project contains over 100 commits (though some surely containing chunks of functionality not identified within the commit), merged PRs are related chunks of work (generally isolated to specific classes), and commit messages are specific. 
