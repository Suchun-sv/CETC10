#include<bits/stdc++.h>
using namespace std;
#define re register
#define il inline
il int read()
{
    re int x=0,f=1;char c=getchar();
    while(c<'0'||c>'9'){if(c=='-') f=-1;c=getchar();}
    while(c>='0'&&c<='9') x=(x<<3)+(x<<1)+(c^48),c=getchar();
    return x*f;
}
struct Edge
{
    int u,v;
	double w;
}edge[200005];
struct node{
	int u;
	int v;
};
int fa[5005],n,m,eu,ev,cnt;
double ans;
int hh =0;
il bool cmp(Edge a,Edge b)
{
    return a.w<b.w;
}
//快排的依据（按边权排序）
node walk[50];
il int find(int x)
{
    while(x!=fa[x]) x=fa[x]=fa[fa[x]];
    return x;
}
//并查集循环实现模板，及路径压缩，不懂并查集的同学可以戳一戳代码上方的“并查集详解”
il void kruskal()
{
    sort(edge,edge+m,cmp);
    for(int i=0;i<m;i++)
    {
    	cout<<edge[i].u<<" "<<edge[i].v<<" "<<edge[i].w<<endl;
	}
    //将边的权值排序
    for(re int i=0;i<m;i++)
    {
        eu=find(edge[i].u), ev=find(edge[i].v);
        if(eu==ev)
        {
            continue;
        }
        //若出现两个点已经联通了，则说明这一条边不需要了
        ans+=edge[i].w;
        walk[hh].u=edge[i].u;
        walk[hh++].v=edge[i].v;
        //将此边权计入答案
        fa[ev]=eu;
        //将eu、ev合并
        if(++cnt==n-1)
        {
            break;
        }
        //循环结束条件，及边数为点数减一时
    }
}
const int CITY=21;
double temp;

int main()
{
#ifdef LOCAL
freopen("C:/Users/hsxny/Desktop/shuru.txt","r",stdin);
#endif
	n = 21*21;
    for(re int i=1;i<=n;i++)
    {
        fa[i]=i;
    }
    int cntt =0;
    for(int i=0;i<CITY;i++)
    {
    	for(int j=0;j<CITY;j++)
    	{
    		cin>>temp;
    		cout<<temp<<endl;
    		if(temp!=0)
    		{
    			edge[cntt].u = i;
				edge[cntt].v = j;
				edge[cntt++].w = temp;
				m++;	
			}
		}
	}
    //初始化并查集
    kruskal();
    printf("%llf\n",ans);
    for(int i=0;i<20;i++)
    {
    	cout<<walk[i].u<<" "<<walk[i].v<<endl;
	}
    return 0;
}
