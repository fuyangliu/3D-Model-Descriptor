function [d,DD]=dijkstra(D,s)

[m,n]=size(D);
d=inf.*ones(1,m);
d(1,s)=0;
dd=zeros(1,m);
dd(1,s)=1;
y=s;
DD=zeros(m,m);
DD(y,y)=1;
counter=1;
index = 0;
while length(find(dd==1))<m
     for i=1:m
         if dd(i)==0
             d(i)=min(d(i),d(y)+D(y,i));
         end
     end
     ddd=inf;
     for i=1:m
         if dd(i)==0&&d(i)<ddd
             ddd=d(i);
         end
     end
     yy=find(d==ddd);
     counter=counter+1;
     DD(y,yy(1,1))=counter;
     DD(yy(1,1),y)=counter;
     y=yy(1,1);
     dd(1,y)=1;
     index = index + 1;
     if index > 3500
        break;
     end
end