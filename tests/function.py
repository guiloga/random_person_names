from src.function import generate_random_names


def test_generate_random_names():
    names = generate_random_names(12)
    assert len(names.split(',')) == 12
