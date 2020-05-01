// 순서대로 느려짐

// 1. O(log(n))
while(n)
    n/=2;

// 2. O(sqrt(n))
for(int i=0;i*i<=n;i++);

// 3. O(n)
for(int i=0;i<n;i++);

// 4. O(nlog(n))
for(int i=0;i<n;i++)
    for(int j=i;j;j/=2);

// 5. O(nsqrt(n))
for(int i=0;i<n;i++)
    for(int j=0;i*j<=i;j++);

// 6. O(n^2)
for(int i=0;i<n;i++)
    for(int j=0;j<n;j++);

// 7. O(n^3)
for(int i=0;i<n;i++)
    for(int j=0;j<n;j++)
        for(int k=0;k<n;k++);

//8. O(2^n)
int function(int n){
    if(n==0||n==1)
        return 1;
    return function(n-1)+function(n-2);
}

// 9. O(n!)
// n개의 데이터를 나열하는 방법의 수
void function(int x, vector<int> pick, vector<bool> picked){
    if(x==n){
        for(int i=0; i<pick.size(); i++)
            printf("%d\n", pick[i]);
        return;
    }
    for(int i=0;i<n;i++){
        if(picked[i])
            continue;
        pick.push_back(i);
        picked[i]=true;
        function(x+1, pick, picked);
        pick.pop_back();
        picked[i]=false;
    }
    return; 
} 