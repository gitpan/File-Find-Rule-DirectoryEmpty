use ExtUtils::MakeMaker;
WriteMakefile(
	VERSION_FROM =>'lib/File/Find/Rule/DirectoryEmpty.pm',
	NAME => 'File::Find::Rule::DirectoryEmpty',
	PREREQ_PM => {
		'File::Find::Rule' => '0.30',
	},
);
