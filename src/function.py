#!/usr/bin/env python

from typing import List

from faker import Faker
from scaladecore import scalade_func
from scaladecore.managers import ContextManager
from scaladecore.variables import Variable


def generate_random_names(total: int) -> List[str]:
    fake = Faker()
    names = []
    for i in range(total):
        names.append(fake.name())
        print(f'[{i}] Fake name: {names[-1]}')
    return ",".join(names)


@scalade_func
def main(ctx: ContextManager): # pragma: no cover
    total_names = ctx.GetInput('TotalGetNames').value

    print('## Generating a total of %s random names.' % total_names)
    names = generate_random_names(total_names)
    names_output = Variable.create(
        type_='text', id_name='Names', value=names)
    ctx.Output(names_output)
    ctx.Complete()

    print('## Completed')


if __name__ == '__main__':
    main()
