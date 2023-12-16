program HeapSort;

type
Comparator = function(a, b: Integer): Boolean;

var
inputFile, outputFile: Text;
data: array of Integer;

function Greater(a, b: Integer): Boolean;
begin
// реализация компаратора для сортировки по убыванию
Greater := a > b;
end;

function Less(a, b: Integer): Boolean;
begin
// реализация компаратора для сортировки по возрастанию
Less := a < b;
end;

procedure Swap(var a, b: Integer);
var
temp: Integer;
begin
temp := a;
a := b;
b := temp;
end;

procedure Heapify(var arr: array of Integer; n, i: Integer; comp: Comparator);
var
largest, l, r: Integer;
begin
largest := i;
l := 2 * i + 1;
r := 2 * i + 2;

if (l < n) and comp(arr[l], arr[largest]) then
largest := l;

if (r < n) and comp(arr[r], arr[largest]) then
largest := r;

if largest <> i then
begin
Swap(arr[i], arr[largest]);
Heapify(arr, n, largest, comp);
end;
end;

procedure BuildHeap(var arr: array of Integer; comp: Comparator);
var
n, i: Integer;
begin
n := Length(arr);
for i := n div 2 - 1 downto 0 do
Heapify(arr, n, i, comp);
end;

procedure Heap(var arr: array of Integer; comp: Comparator);
var
n, i: Integer;
begin
n := Length(arr);

BuildHeap(arr, comp);

for i := n - 1 downto 0 do
begin
Swap(arr[0], arr[i]);
Heapify(arr, i, 0, comp);
end;
end;

procedure ReadData(var arr: array of Integer; var input: Text);
var
num, i: Integer;
begin
i := 0;
while not Eof(input) do
begin
Read(input, num);
SetLength(arr, i + 1);
arr[i] := num;
Inc(i);
end;
end;

procedure WriteData(var arr: array of Integer; var output: Text);
var
i: Integer;
begin
for i := 0 to Length(arr) - 1 do
Write(output, arr[i], ' ');
end;

begin
Assign(inputFile, 'input.txt');
Reset(inputFile);

Assign(outputFile, 'output.txt');
Rewrite(outputFile);

ReadData(data, inputFile);

// вызов пирамидальной сортировки с передачей компаратора в качестве параметра
Heap(data, Greater);

WriteData(data, outputFile);

Close(inputFile);
Close(outputFile);
end.
