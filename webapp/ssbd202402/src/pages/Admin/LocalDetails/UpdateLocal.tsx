import ConfirmDialog from "@/components/ConfirmDialog";
import RefreshQueryButton from "@/components/RefreshQueryButton";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger} from "@/components/ui/dropdown-menu";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { useUpdateLocalData } from "@/data/local/useMutateLocalUpdate";
import { useGetLocalDetailsForAdmin } from "@/data/local/useGetLocalDetailsForAdmin";
import { zodResolver } from "@hookform/resolvers/zod";
import { useTranslation } from "react-i18next";
import { FC } from "react";
import { useForm } from "react-hook-form";
import { z } from "zod";
import { Button } from "@/components/ui/button.tsx";
import { toast } from "@/components/ui/use-toast.ts";
import {TFunction} from "i18next";

export const updateLocalDetailsSchema = (t: TFunction) => z.object({
    id: z.string(),
    name: z.string().min(1, { message: t("updateLocalPage.wrong.name") }),
    description: z.string().min(1, { message: t("updateLocalPage.wrong.description") }),
    size: z.number().min(1, { message: t("updateLocalPage.wrong.size") }),
    state: z.enum(["WITHOUT_OWNER", "UNAPPROVED", "ACTIVE", "ARCHIVED", "INACTIVE", "RENTED"], {
        errorMap: () => ({ message: t("updateLocalPage.wrong.state") })
    })
});

type UpdateLocalFormData = z.infer<ReturnType<typeof updateLocalDetailsSchema>>;

interface LocalToUpdate {
    localId: string;
}

const UpdateLocalData: FC<LocalToUpdate> = ({ localId }) => {
    const { t } = useTranslation();
    const { data } = useGetLocalDetailsForAdmin(localId!);
    const mutateAsync = useUpdateLocalData();

    const form = useForm<UpdateLocalFormData>({
        resolver: zodResolver(updateLocalDetailsSchema(t)),
        defaultValues: {
            id: localId,
            name: data?.data.name,
            description: data?.data.description,
            size: data?.data.size,
            state: data?.data.state,
        },
    });

    const updateLocalData = form.handleSubmit((request) => {
        let etag: string = data?.headers.etag;
        if (!etag) {
            toast({
                variant: "destructive",
                title: t("updateLocalPage.errorTitle"),
            });
            return;
        }
        etag = etag.substring(1, etag.length - 1);
        mutateAsync.mutate({ request, etag });
    });

    const stateToTranslationKey = (state: string) => {
        switch (state) {
            case "WITHOUT_OWNER":
                return "updateLocalPage.states.withoutOwner";
            case "UNAPPROVED":
                return "updateLocalPage.states.unapproved";
            case "ACTIVE":
                return "updateLocalPage.states.active";
            case "INACTIVE":
                return "updateLocalPage.states.inactive";
            case "RENTED":
                return "updateLocalPage.states.rented";
            case "ARCHIVED":
                return "updateLocalPage.states.archived";
            default:
                return "updateLocalPage.states.unknown";
        }
    };
    return (
        <Card className="relative">
            <CardHeader>
                <CardTitle className="text-center">
                    {t("updateLocalPage.updateData")}
                </CardTitle>
            </CardHeader>
            <CardContent className="flex justify-center">
                <Form {...form}>
                    <form onSubmit={updateLocalData} className="flex w-3/4 flex-col gap-3">
                        <FormField
                            control={form.control}
                            name="name"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>{t("updateLocalPage.name")}</FormLabel>
                                    <FormControl>
                                        <Input {...field} />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />
                        <FormField
                            control={form.control}
                            name="description"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>{t("updateLocalPage.description")}</FormLabel>
                                    <FormControl>
                                        <Input {...field} />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />
                        <FormField
                            control={form.control}
                            name="size"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>{t("updateLocalPage.size")}</FormLabel>
                                    <FormControl>
                                        <Input
                                            {...field}
                                            type="number"
                                            onChange={(event) => {
                                                const value = parseFloat(event.target.value);
                                                field.onChange(value);
                                            }}
                                        />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />
                        <FormField
                            control={form.control}
                            name="state"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>{t("updateLocalPage.state")}</FormLabel>
                                    <DropdownMenu>
                                        <DropdownMenuTrigger>
                                            <Button variant="outline" className="ml-2">{t(stateToTranslationKey(form.getValues('state')))}</Button>
                                        </DropdownMenuTrigger>
                                        <DropdownMenuContent>
                                            <DropdownMenuItem onClick={() => field.onChange("WITHOUT_OWNER")}>
                                                {t("updateLocalPage.states.withoutOwner")}
                                            </DropdownMenuItem>
                                            <DropdownMenuItem onClick={() => field.onChange("UNAPPROVED")}>
                                                {t("updateLocalPage.states.unapproved")}
                                            </DropdownMenuItem>
                                            <DropdownMenuItem onClick={() => field.onChange("ACTIVE")}>
                                                {t("updateLocalPage.states.active")}
                                            </DropdownMenuItem>
                                            <DropdownMenuItem onClick={() => field.onChange("INACTIVE")}>
                                                {t("updateLocalPage.states.inactive")}
                                            </DropdownMenuItem>
                                            <DropdownMenuItem onClick={() => field.onChange("RENTED")}>
                                                {t("updateLocalPage.states.rented")}
                                            </DropdownMenuItem>
                                            <DropdownMenuItem onClick={() => field.onChange("ARCHIVED")}>
                                                {t("updateLocalPage.states.archived")}
                                            </DropdownMenuItem>
                                        </DropdownMenuContent>
                                    </DropdownMenu>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <Button type="button" variant="outline" onClick={() => form.reset()}>
                            {t("updateLocalPage.reset")}
                        </Button>
                        <ConfirmDialog
                            className="mt-5"
                            buttonText={t("common.update")}
                            dialogTitle={t("common.confirmDialogTitle")}
                            dialogDescription={t("changeAddressForm.confirmDialogDescription")}
                            confirmAction={() => updateLocalData()}
                        />
                    </form>
                </Form>
            </CardContent>
            <RefreshQueryButton
                className="absolute right-1 top-1"
                queryKeys={["localDetailsForAdmin"]}
            />
        </Card>
    );
};

export default UpdateLocalData;
