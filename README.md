# cppy
Write C++ code with Python style indentation

### examples
```cpp
#include <iostream>
using namespace std;

int main()
    int sum=0;
    int count=0;
    for(int i=1; i<=100; i++)
        if (i%3==0 || i%5==0)
            sum+=i;
            count+=1;
    cout<<sum;
    return 0;
```
to
```cpp
#include <iostream>
using namespace std;

int main()
{
    int sum=0;
    int count=0;
    for(int i=1; i<=100; i++)
    {
        if (i%3==0 || i%5==0)
        {
            sum+=i;
            count+=1;
        }
    }
    cout<<sum;
    return 0;
}
```
