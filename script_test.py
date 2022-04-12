import script_test

def test_hello_world(capsys):
    script_test.hello_world()
    out, err = capsys.readouterr()

    assert out == 'hello world\n'
    assert err == ''
