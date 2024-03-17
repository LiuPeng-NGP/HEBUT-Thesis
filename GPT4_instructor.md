## 选择“毕业论文”或“毕业设计说明书”
为了让使用者能够在使用LaTeX模板时选择不同的页面类选项，比如“毕业论文”和“毕业设计说明书”，你需要在`.cls`文件中定义这些选项，并在`.tex`文件中允许用户选择它们。以下是如何在`.cls`文件和`.tex`文件中实现这个功能的详细步骤：

### 步骤1: 修改`.cls`文件

1. **定义类选项**：使用`\DeclareOption{}`命令在`.cls`文件中定义`thesis`（毕业论文）和`design`（毕设设计说明书）两个选项。

2. **配置选项**：使用选项来设置不同的文档类型所需的格式。

3. **处理选项**：使用`\ProcessOptions\relax`命令处理选项。

示例代码（在`.cls`文件中）：

```latex
\ProvidesClass{mythesis}[2024/03/17 My Thesis and Design Template]
\DeclareOption{thesis}{
  \def\doctype{毕业论文}
  % 特定于毕业论文的设置
}
\DeclareOption{design}{
  \def\doctype{毕业设计说明书}
  % 特定于毕设设计说明书的设置
}
\ExecuteOptions{thesis} % 默认选项
\ProcessOptions\relax

\LoadClass{report} % 基础文档类

% 可以在这里定义更多的命令和设置
\newcommand{\doctype}{}

\newcommand{\makemytitle}{
  \begin{titlepage}
    \centering
    {\Huge \doctype}
    % 根据需要添加其他标题页内容
  \end{titlepage}
}
```

### 步骤2: 在`.tex`文件中使用选项

在`.tex`文件的导言区，使用者可以通过传递`thesis`或`design`选项给`\documentclass`命令来选择他们需要的文档类型。

示例代码（在`.tex`文件中）：

```latex
\documentclass[design]{mythesis} % 这里选择“design”选项

\title{我的毕业设计}
\author{学生姓名}

\begin{document}

\makemytitle

\chapter{引言}
这是一个关于如何在LaTeX中使用文档类选项来区分不同类型文档的示例。

% 文档的其余部分

\end{document}
```

这个方法允许使用者在编写文档时通过简单地更改`\documentclass`命令中的选项来选择他们想要的页面类型。`.cls`文件中的定义确保了每种类型的页面布局和格式设置按照预定的方式应用，而使用者不需要对此进行深入了解或手动修改设置。

确保在模板的文档说明中详细说明如何使用这些选项，以便使用者可以轻松选择并应用他们需要的文档类型。

## 自行选择年份

为了让用户能够自定义页眉中的年份，你可以在`.cls`文件中定义一个命令让用户输入年份，然后在页眉设置中使用这个命令。这样，用户可以在`.tex`文档中自行定义年份，而无需修改`.cls`文件。以下是实现这一功能的步骤：

### 步骤 1: 修改 `.cls` 文件

1. **定义一个新命令**：在`.cls`文件中定义一个新命令（比如`\theyear`），供用户设置年份。
2. **设置默认年份**：为了防止用户忘记设置年份，可以提供一个默认值。
3. **使用定义的命令**：在页眉设置中使用`\theyear`命令来显示年份。

示例代码（`.cls`文件中）：

```latex
\ProvidesClass{mythesis}[2024/03/17 My Custom Thesis Class]
\LoadClass{report} % 这里以report类为例

\newcommand{\setyear}[1]{\def\theyear{#1}} % 用户设置年份的命令
\newcommand{\theyear}{\the\year} % 默认年份为当前年份

% 页眉设置，以fancyhdr包为例
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % 清除默认页眉页脚
\fancyhead[L]{\theyear} % 左页眉显示年份
\fancyfoot[C]{\thepage} % 页脚中央显示页码
\renewcommand{\headrulewidth}{0.4pt} % 页眉下的分隔线
```

### 步骤 2: 在 `.tex` 文件中定义年份

用户可以在`.tex`文件的导言区通过`\setyear`命令自定义年份。

示例代码（`.tex`文件中）：

```latex
\documentclass{mythesis}
\setyear{2024} % 用户自定义年份

\title{我的毕业设计}
\author{学生姓名}

\begin{document}

\maketitle

% 文档内容

\end{document}
```

通过这种方式，用户可以很容易地自定义页眉中的年份，而不需要直接修改`.cls`文件。同时，这个方法也为模板提供了更好的灵活性和可用性。确保在模板的文档说明中明确如何使用`\setyear`命令来设置年份，这样用户就能够正确地利用这个功能。