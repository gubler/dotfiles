vim.g.projectionist_heuristics = {
    ['symfony.lock'] = {
        ['src/*.php'] = {
            type = 'source',
            alternate = {
                'tests/Unit/{}Test.php',
                'tests/Integration/{}Test.php',
                'tests/Acceptance/{}Test.php',
            },
        },
        ['tests/Acceptance/*Test.php'] = {
            type = 'test',
            alternate = 'src/{}.php',
        },
        ['tests/Unit/*Test.php'] = {
            type = 'test',
            alternate = 'src/{}.php',
        },
        ['tests/Integration/*Test.php'] = {
            type = 'test',
            alternate = 'src/{}.php',
        },
        ['src/Entity/*.php'] = {
            type = 'entity',
        },
        ['src/Controller/*.php'] = {
            type = 'controller',
        },
        ['migrations/*.php'] = {
            type = 'migration',
        },
    }
}
