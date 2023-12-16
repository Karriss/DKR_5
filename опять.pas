program bubblesort;

type
  tcomparator = function(a, b: integer): boolean;

var
  inputfilename, outputfilename: string;
  data: array of integer;
  i: integer;
  comparator: tcomparator;
  inputfile, outputfile: text;

function ascendingcomparator(a, b: integer): boolean;
begin
  result := a > b;
end;

function descendingcomparator(a, b: integer): boolean;
begin
  result := a < b;
end;

procedure bubble(var arr: array of integer; comp: tcomparator);
var
  i, j, temp: integer;
begin
  // Проходим по всем элементам массива
  for i := 0 to length(arr) - 1 do
  begin
    // Проходим по элементам массива сравнивая каждый соседний элемент
    for j := 0 to length(arr) - i - 2 do
    begin
      // Если текущий элемент больше следующего, меняем их местами
      if comp(arr[j], arr[j + 1]) then
      begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
      end;
    end;
  end;
end;

begin
  inputfilename := 'input.txt';
  outputfilename := 'output.txt';

  // Открываем файл для чтения
  assign(inputfile, inputfilename);
  reset(inputfile);

  setlength(data, 0);
  // Читаем данные из файла
  while not eof(inputfile) do
  begin
    setlength(data, length(data) + 1);
    readln(inputfile, data[high(data)]);
  end;

  close(inputfile);

  comparator := ascendingcomparator; // По умолчанию используем компаратор для сортировки по возрастанию
  bubble(data, comparator); // Сортируем массив с использованием функции bubble

  // Открываем файл для записи
  assign(outputfile, outputfilename);
  rewrite(outputfile);

  // Записываем отсортированные данные в файл
  for i := 0 to length(data) - 1 do
  begin
    writeln(outputfile, data[i]);
  end;

  close(outputfile);
end.